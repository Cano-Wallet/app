import 'dart:async';

import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/busy_indicator.widget.dart';
import 'package:cano/features/general/centered_placeholder.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class BaseListController extends GetxController with ConsoleMixin, StateMixin {
  // VARIABLES
  final refreshController = RefreshController(initialRefresh: false);
  final scrollController = ScrollController();

  final pageSize = rpcMaxPageSize;
  int pageIndex = 0, maxPageIndex = 0;
  bool initialLoad = true;

  // PROPERTIES
  final data = <dynamic>[].obs;

  // GETTERS

  // is end of page
  bool get canLoadMore => pageIndex < maxPageIndex;

  // INIT
  @override
  void onReady() {
    reload();
    super.onReady();
  }

  // FUNCTIONS
  void reload() async {
    await fetch();
    refreshController.refreshCompleted();
  }

  void loadMore() async {
    await fetch(loadMore: true);
    refreshController.loadComplete();
  }

  void preFetch(bool loadMore) {
    if (loadMore) {
      // increment page index if load more
      pageIndex++;
    } else {
      // restart indexes if reload
      pageIndex = 0;
      maxPageIndex = 0;
    }

    // loading state
    change(
      null,
      status: initialLoad ? RxStatus.loading() : RxStatus.loadingMore(),
    );
  }

  void postFetch(bool loadMore, dynamic object) {
    if (loadMore) {
      data.addAll(object.list); // append
    } else {
      data.assignAll(object.list); // set
    }

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );

    // calculate max page index
    maxPageIndex = object.count ~/ pageSize;
    // we've finished loaded the initial data
    initialLoad = false;

    console.warning(
      'max: $maxPageIndex, index: $pageIndex, count: ${object.count}',
    );
  }

  void onException(bool loadMore, Object e) {
    if (loadMore) {
      refreshController.loadFailed();
      change(null, status: RxStatus.success());
      // TODO: display error
    } else {
      refreshController.refreshFailed();
      change(null, status: RxStatus.error(e.toString()));
    }

    return console.error('Error: $e');
  }

  /// override this
  Future<void> fetch({bool loadMore = false}) async {
    console.error('must override fetch()');
  }

  Widget itemBuilder(BuildContext context, int index) {
    console.error('must override itemBuilder()');
    return const Text('must override itemBuilder()');
  }

  Widget listView() => Obx(
        () => SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: canLoadMore,
          onRefresh: reload,
          // TODO: add load more support for Desktop
          onLoading: loadMore,
          child: ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      );

  Widget content() => obx(
        (_) => listView(),
        onLoading: const BusyIndicator(),
        onEmpty: CenteredPlaceholder(
          iconData: Icons.list_alt_outlined,
          message: 'empty',
          child: OutlinedButton(
            child: const Text('Refresh'),
            onPressed: reload,
            style: Styles.outlinedButtonStyle20,
          ),
        ),
        onError: (error) => CenteredPlaceholder(
          iconData: Icons.error,
          message: error!,
          child: OutlinedButton(
            child: const Text('Try again'),
            style: Styles.outlinedButtonStyle20,
            onPressed: reload,
          ),
        ),
      );
}

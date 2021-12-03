import 'dart:async';

import 'package:cano/core/animations/animations.dart';
import 'package:cano/core/controllers/base_list.controller.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/general/selector.sheet.dart';
import 'package:cano/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarListViewController extends BaseListController {
  final List<Widget> headers;
  PillarListViewController({this.headers = const []});

  static PillarListViewController get to => Get.find();

  // VARIABLES
  @override
  int get pageSize => 20;

  // PROPERTIES

  // GETTERS
  int get topWeight => (data.first as PillarInfo).weight;

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  // FUNCTIONS

  @override
  Future<void> fetch({bool loadMore = false}) async {
    preFetch(loadMore);

    PillarInfoList? object;

    try {
      object = await Zenon().embedded.pillar.getAll(
            pageIndex: pageIndex,
            pageSize: pageSize,
          );
    } catch (e) {
      return onException(loadMore, e);
    }

    postFetch(loadMore, object);
  }

  @override
  Widget itemBuilder(context, index) {
    final object = data[index] as PillarInfo;

    final footer = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PercentageIndicator(
          maxPercentage: 100,
          percentage: object.giveMomentumRewardPercentage,
          color: Colors.lightGreenAccent,
          iconData: LineIcons.cube,
        ),
        PercentageIndicator(
          maxPercentage: 100,
          percentage: object.giveDelegateRewardPercentage,
          color: Colors.pinkAccent,
          iconData: LineIcons.handHoldingUsDollar,
        ),
        PercentageIndicator(
          maxPercentage: topWeight,
          percentage: object.weight,
          label:
              '${Utils.formatKNumber(AmountUtils.addDecimals(object.weight, znnDecimals))} ZNN',
          color: Colors.blueAccent,
          iconData: LineIcons.balanceScaleRightWeighted,
        ),
      ],
    );

    final item = ListItemAnimation(
      child: ListTile(
        title: Text(object.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(object.producerAddress.toString()),
            const SizedBox(height: 5),
            footer,
          ],
        ),
        onTap: () => onTap(object),
      ),
    );

    if (index > 0) return item;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...headers,
        item,
      ],
    );
  }

  void onTap(PillarInfo object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Delegate',
          leading: const Icon(LineIcons.handHoldingUsDollar),
          onSelected: () {
            //
          },
        ),
        SelectorItem(
          title: 'Copy',
          leading: const Icon(LineIcons.copy),
          onSelected: () => Utils.copyToClipboard(
            object.producerAddress.toString(),
          ),
        ),
        SelectorItem(
          title: 'Details',
          leading: const Icon(LineIcons.laptopCode),
          onSelected: () {
            Get.to(() => JSONViewerScreen(data: object.toJson()));
          },
        ),
      ],
    ).show();
  }
}

class PercentageIndicator extends StatelessWidget {
  final int percentage;
  final int maxPercentage;
  final String? label;
  final Color color;
  final IconData? iconData;

  const PercentageIndicator({
    Key? key,
    this.percentage = 0,
    this.maxPercentage = 100,
    this.color = Colors.yellow,
    required this.iconData,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: color),
        const SizedBox(width: 5),
        CircularPercentIndicator(
          radius: 18,
          lineWidth: 4.0,
          percent: percentage / maxPercentage,
          progressColor: color,
          backgroundColor: Colors.grey.shade800,
        ),
        const SizedBox(width: 5),
        Text(label ?? '$percentage%'),
      ],
    );
  }
}

import 'dart:io';

import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/ui_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

class Utils {
  static final console = Console(name: 'Utils');

  static Future<File?> pickKeyStoreFile() async {
    FilePickerResult? result;

    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );
    } catch (e) {
      console.error('FilePicker error: $e');
      return null;
    }

    if (result == null || result.files.isEmpty) {
      console.warning("canceled file picker");
      return null;
    }

    return File(result.files.single.path!);
  }

  static Future<bool> deleteDirectory(final Directory dir) async {
    if (await dir.exists()) {
      await dir.delete(recursive: true);
      console.info("deleted: ${dir.path}");
      return true;
    } else {
      console.error('${dir.path} doesnt exist');
      return false;
    }
  }

  static String formatKNumber(num number) {
    // TODO: set locale
    return NumberFormat.compact().format(number);
  }

  static String formatNumber(num number) {
    // TODO: set locale
    return NumberFormat.currency(symbol: '', decimalDigits: 0).format(number);
  }

  static String formatCurrency(num number) {
    // TODO: set locale
    return NumberFormat.currency(symbol: '', decimalDigits: 2).format(number);
  }

  static void copyToClipboard(text) async {
    await Clipboard.setData(ClipboardData(text: text));
    // TODO: localize
    UIUtils.showSnackBar(
      title: 'Copied',
      message: 'Successfully copied to clipboard',
      icon: const Icon(LineIcons.copy),
      seconds: 4,
    );
  }

  static String timeAgo(DateTime dateTime, {bool short = true}) {
    final _locale =
        (Get.locale?.languageCode ?? 'en_US') + (short ? "_short" : "");
    return timeago.format(dateTime, locale: _locale).replaceFirst("~", "");
  }
}

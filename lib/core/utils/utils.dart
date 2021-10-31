import 'dart:io';

import 'package:example/core/utils/console.dart';
import 'package:file_picker/file_picker.dart';

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
}

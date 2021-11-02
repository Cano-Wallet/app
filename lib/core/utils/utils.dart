import 'dart:io';

import 'package:app/core/utils/console.dart';
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
}

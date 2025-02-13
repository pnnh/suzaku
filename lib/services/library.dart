import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:suzaku/models/file.dart';

Future<List<SKFileModel>> selectLibrarys() async {
  var list = <SKFileModel>[];

  var currentPath = Directory.current.path;
  debugPrint("currentPath: $currentPath");
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  debugPrint("appDocumentsDir, $appDocumentsDir");

  var dir = appDocumentsDir;
  var lists = dir.listSync();
  for (var item in lists) {
    var libraryExt = ".vslibrary";
    if (item is Directory && item.path.endsWith(libraryExt)) {
      var filename = basename(item.path);
      var title = filename.substring(0, filename.length - libraryExt.length);
      list.add(SKFileModel(filename, path: item.path, name: title));
    }
  }

  return list;
}

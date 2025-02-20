import 'dart:io';

import 'package:path/path.dart';
import 'package:suzaku/models/file.dart';

class SKLocationModel {
  String path;

  SKLocationModel(this.path);

  SKLocationModel.fromDirectory(Directory dir) : path = dir.path;

  SKLocationModel.fromPath(String path) : path = path;
}

Future<List<SKLocationModel>> selectLocations() async {
  var foldersList = List<SKLocationModel>.empty(growable: true);
  foldersList.add(SKLocationModel("file://work"));

  return foldersList;
}

Future<List<SKFileModel>> selectSubDirectories(SKFileModel fileModel) async {
  var list = <SKFileModel>[];
  if (!fileModel.isFolder) {
    return list;
  }

  var dir = Directory(fileModel.path);
  var lists = dir.listSync();
  for (var item in lists) {
    var filename = basename(item.path);
    if (filename.startsWith(".")) {
      continue;
    }
    list.add(SKFileModel(filename, path: item.path, name: filename));
  }

  return list;
}

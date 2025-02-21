import 'dart:io';

import 'package:path/path.dart';
import 'package:suzaku/models/file.dart';

class SKLocationModel {
  String realPath;
  String showPath = "";
  bool isRoot = false;
  bool isLeaf = false;

  SKLocationModel(this.realPath);

  SKLocationModel.fromDirectory(Directory dir) : realPath = dir.path;

  static SKLocationModel fromPath(String path) {
    var model = SKLocationModel(path);
    model.showPath = path;
    return model;
  }
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

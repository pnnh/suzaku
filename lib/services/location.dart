import 'dart:io';

import 'package:path/path.dart';
import 'package:suzaku/models/file.dart';

Future<List<SKFileModel>> selectLocations(SKFileModel albumModel) async {
  var list = <SKFileModel>[];

  var dir = Directory(albumModel.path);
  var lists = dir.listSync();
  for (var item in lists) {
    if (item is Directory) {
      var filename = basename(item.path);
      list.add(SKFileModel(filename, path: item.path, name: filename));
    }
  }

  return list;
}

Future<List<SKFileModel>> selectSubDirectories(SKFileModel fileModel) async {
  var list = <SKFileModel>[];
  if (!fileModel.isFolder) {
    return list;
  }

  var dir = Directory(fileModel.path);
  var lists = dir.listSync();
  for (var item in lists) {
    if (item is Directory) {
      var filename = basename(item.path);
      list.add(SKFileModel(filename, path: item.path, name: filename));
    }
  }

  return list;
}

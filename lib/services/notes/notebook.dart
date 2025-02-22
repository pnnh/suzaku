import 'dart:io';

import 'package:path/path.dart';
import 'package:quantum/quantum.dart';
import 'package:quantum/utils/md5.dart';

class SKNotebookModel {
  String uid = "";
  String name = "";
  String realPath;
  String showPath = "";

  SKNotebookModel(this.realPath);

  SKNotebookModel.fromDirectory(Directory dir) : realPath = dir.path;

  static SKNotebookModel fromPath(String path) {
    var model = SKNotebookModel(path);
    model.showPath = path;
    return model;
  }
}

Future<List<SKNotebookModel>> selectNotebooks(String filePath) async {
  var notebookList = List<SKNotebookModel>.empty(growable: true);
  var realPath = Quantum.resolvePath(filePath);
  if (realPath == null) {
    return notebookList;
  }
  var dir = Directory(realPath);
  var lists = dir.listSync();
  for (var item in lists) {
    var filename = basename(item.path);
    var uid = generateMd5ForUUID(filename);
    if (item is File) {
      continue;
    }
    if (!item.path.endsWith(".notebook")) {
      continue;
    }
    var model = SKNotebookModel(item.path);
    model.uid = uid;
    model.name = basename(item.path);
    model.showPath = item.path;
    notebookList.add(model);
  }

  return notebookList;
}

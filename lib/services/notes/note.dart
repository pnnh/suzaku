import 'dart:io';

import 'package:path/path.dart';
import 'package:quantum/utils/md5.dart';
import 'package:quantum/filesystem/path.dart';

class SKNoteModel {
  String uid = "";
  String name = "";
  String realPath;
  String showPath = "";
  String content = "";

  SKNoteModel(this.realPath);

  SKNoteModel.fromDirectory(Directory dir) : realPath = dir.path;

  static SKNoteModel fromPath(String path) {
    var model = SKNoteModel(path);
    model.showPath = path;
    return model;
  }
}

Future<List<SKNoteModel>> selectNotes(String filePath) async {
  var noteList = List<SKNoteModel>.empty(growable: true);
  var realPath = await resolvePath(filePath);
  if (realPath == null) {
    return noteList;
  }
  var dir = Directory(realPath);
  var lists = dir.listSync();
  for (var item in lists) {
    var filename = basename(item.path);
    var uid = generateMd5ForUUID(filename);
    if (item is File) {
      continue;
    }
    if (!item.path.endsWith(".note")) {
      continue;
    }
    var model = SKNoteModel(item.path);
    model.uid = uid;
    model.name = basename(item.path);
    model.showPath = item.path;
    noteList.add(model);
  }

  return noteList;
}

Future<SKNoteModel> mustQueryNote(String filePath) async {
  var realPath = await resolvePath(filePath);
  if (realPath == null) {
    throw Exception("目录解析异常");
  }
  var dir = Directory(realPath);
  var indexFile = File(join(realPath, "index.md"));
  if (indexFile.existsSync()) {
    var filename = basename(indexFile.path);
    var uid = generateMd5ForUUID(filename);

    var model = SKNoteModel(indexFile.path);
    model.uid = uid;
    model.name = basename(indexFile.path);
    model.showPath = indexFile.path;
    model.content = indexFile.readAsStringSync();
    return model;
  }

  throw Exception("目录解析异常mustQueryNote");
}

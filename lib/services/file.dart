import 'dart:io';

import 'package:path/path.dart';
import 'package:quantum/quantum.dart';
import 'package:suzaku/models/file.dart';
import 'package:quantum/utils/md5.dart';

Future<List<SKFileModel>> selectFilesFromPath(String filePath) async {
  var list = <SKFileModel>[];

  var realPath = Quantum.resolvePath(filePath);
  if (realPath == null) {
    return list;
  }
  var dir = Directory(realPath);
  var lists = dir.listSync();
  for (var item in lists) {
    var filename = basename(item.path);
    if (filename.startsWith(".")) {
      continue;
    }
    var uid = generateMd5ForUUID(filename);
    var model = SKFileModel(uid, path: item.path, name: filename);
    model.isFolder = item is Directory;
    list.add(model);
  }

  return list;
}

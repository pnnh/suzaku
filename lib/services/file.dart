import 'dart:io';

import 'package:path/path.dart';
import 'package:quantum/quantum.dart';
import 'package:quantum/utils/md5.dart';
import 'package:suzaku/models/file.dart';

Future<List<SKFileModel>> selectFilesFromPath(String filePath,
    {bool justFolder = false, bool skipHidden = true}) async {
  var list = <SKFileModel>[];

  var realPath = Quantum.resolvePath(filePath);
  if (realPath == null) {
    return list;
  }
  var dir = Directory(realPath);
  var lists = dir.listSync();
  for (var item in lists) {
    var filename = basename(item.path);
    if (skipHidden && filename.startsWith(".")) {
      continue;
    }
    var uid = generateMd5ForUUID(filename);
    if (justFolder && item is File) {
      continue;
    }
    var model = SKFileModel(uid, path: item.path, name: filename);
    model.isFolder = item is Directory;
    list.add(model);
  }

  return list;
}

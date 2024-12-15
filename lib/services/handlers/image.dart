import 'dart:io';

import 'package:quantum/utils/image.dart';
import 'package:suzaku/services/models/image.dart';

Future<List<ImageModel>> readImageFilesAsync(String pathName) async {
  Directory dir = Directory(pathName);
  List<ImageModel> list = [];

  var isExists = await dir.exists();
  if (!isExists) {
    return list;
  }

  var lists = await dir.list().toList();
  for (FileSystemEntity entity in lists) {
    if (entity is File) {
      File file = entity;
      if (!isImage(file.path)) {
        continue;
      }
      var model = ImageModel(name: file.path, path: file.path);
      list.add(model);
    }
  }
  return list;
}

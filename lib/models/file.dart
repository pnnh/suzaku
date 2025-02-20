import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:mime/mime.dart';

part 'file.g.dart';

@JsonSerializable()
class SKFileModel {
  String uid;
  String name;
  String path;
  int count = 0;
  bool isFolder = false;

  SKFileModel(this.uid, {required this.path, this.name = "测试文件"});

  bool get isHidden {
    return name.startsWith(".");
  }

  String get fileMime {
    if (isFolder) {
      return "";
    }
    return lookupMimeType(path) ?? "unknown";
  }

  String get fileExtension {
    return path.split(".").last;
  }

  int? get fileSizeNumber {
    if (isFolder) {
      return 0;
    }
    var file = File(path);
    return file.lengthSync();
  }

  String get fileSizeString {
    var length = fileSizeNumber;
    if (length == null) {
      return "";
    }
    if (length < 1024) {
      return "$length B";
    } else if (length < 1024 * 1024) {
      return "${(length / 1024).toStringAsFixed(2)} KB";
    } else if (length < 1024 * 1024 * 1024) {
      return "${(length / 1024 / 1024).toStringAsFixed(2)} MB";
    } else {
      return "${(length / 1024 / 1024 / 1024).toStringAsFixed(2)} GB";
    }
  }

  String get lastModifiedString {
    if (isFolder) {
      return "";
    }
    var file = File(path);
    var lastModified = file.lastModifiedSync();
    return lastModified.toIso8601String();
  }

  factory SKFileModel.fromJson(Map<String, dynamic> json) =>
      _$SKFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SKFileModelToJson(this);
}

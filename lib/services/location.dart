import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:suzaku/services/database/database.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'location.g.dart';

enum SKLocationViewMode { directory, library }

@JsonSerializable()
class SKLocationModel {
  String uid = "";
  @JsonKey(name: "real_path")
  String realPath = "";
  @JsonKey(name: "show_path")
  String showPath = "";
  @JsonKey(name: "is_root", includeFromJson: false, includeToJson: false)
  bool isRoot = false;
  @JsonKey(name: "is_leaf", includeFromJson: false, includeToJson: false)
  bool isLeaf = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  SKLocationViewMode viewModel = SKLocationViewMode.directory;

  SKLocationModel();

  factory SKLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SKLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SKLocationModelToJson(this);

  SKLocationModel.fromDirectory(Directory dir) : realPath = dir.path;

  static SKLocationModel fromPath(String path) {
    var model = SKLocationModel();
    model.uid = const Uuid().v4();
    model.realPath = path;
    model.showPath = path;
    return model;
  }

  static Future<void> insertFolder(SKLocationModel model) async {
    var sqlTextInsertFolder = '''
insert into locations(uid, name, show_path, real_path)
values(?, ?, ?, ?)
on conflict(uid) do update set show_path = excluded.show_path, real_path = excluded.real_path;
''';
    var uuid = const Uuid();
    var uid = uuid.v4();
    var client = await SqliteClient.connect();
    await client.executeAsync(sqlTextInsertFolder,
        [model.uid, model.showPath, model.showPath, model.realPath]);
  }

  static Future<List<SKLocationModel>> selectLocations() async {
    // var foldersList = List<SKLocationModel>.empty(growable: true);
    // foldersList.add(SKLocationModel.fromPath("file://work"));
    // foldersList.add(SKLocationModel.fromPath("file://blog"));

    var sqlText = '''select * from locations;''';

    var client = await SqliteClient.connect();
    var list = await client.selectAsync(sqlText);

    debugPrint("list ${list.length}");

    var locationList = List.generate(list.length, (i) {
      var item = list[i];
      return SKLocationModel.fromJson(item);
    });

    return locationList;
  }
}

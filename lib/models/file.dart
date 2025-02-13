import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class SKFileModel {
  String uid;
  String name;
  String path;
  int count = 0;
  bool isFolder = false;

  SKFileModel(this.uid, {required this.path, this.name = "测试文件"});

  factory SKFileModel.fromJson(Map<String, dynamic> json) =>
      _$SKFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SKFileModelToJson(this);
}

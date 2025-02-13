// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKFileModel _$SKFileModelFromJson(Map<String, dynamic> json) => SKFileModel(
      json['uid'] as String,
      path: json['path'] as String,
      name: json['name'] as String? ?? "测试文件",
    )
      ..count = (json['count'] as num).toInt()
      ..isFolder = json['isFolder'] as bool;

Map<String, dynamic> _$SKFileModelToJson(SKFileModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'path': instance.path,
      'count': instance.count,
      'isFolder': instance.isFolder,
    };

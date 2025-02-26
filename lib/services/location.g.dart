// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKLocationModel _$SKLocationModelFromJson(Map<String, dynamic> json) =>
    SKLocationModel()
      ..uid = json['uid'] as String
      ..realPath = json['real_path'] as String
      ..showPath = json['show_path'] as String;

Map<String, dynamic> _$SKLocationModelToJson(SKLocationModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'real_path': instance.realPath,
      'show_path': instance.showPath,
    };

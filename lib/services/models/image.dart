import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'image.g.dart';

part 'image.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({
    required String name,
    required String path,
    @Default(false) bool completed,
  }) = _ImageModel;
}

@riverpod
class ImageModelState extends _$ImageModelState {
  @override
  Future<ImageModel> build() async {
    return ImageModel(name: '', path: '');
  }

  Future<void> setText(String text) async {
    debugPrint("addTodo");

    var model = ImageModel(name: text, path: text);
    state = AsyncData(model);
    return;
  }
}

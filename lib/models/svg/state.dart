import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../services/common/svg/painter.dart';

part 'state.g.dart';

part 'state.freezed.dart';

@freezed
class SvgModel with _$SvgModel {
  factory SvgModel({
    required String text,
    SvgCanvasPainter? painter,
    @Default(false) bool completed,
  }) = _SvgModel;
}

@riverpod
class SvgModelState extends _$SvgModelState {
  @override
  Future<SvgModel> build() async {
    return SvgModel(text: '暂无预览', painter: null);
  }

  Future<void> setText(String text) async {
    debugPrint("addTodo");

    try {
      var svgPainter = await SvgCanvasPainter.loadSvg('test', text, 1922, 1024);
      var model = SvgModel(text: text, painter: svgPainter);
      state = AsyncData(model);
      return;
    } catch (ex) {
      var errMsg = "预览出错：${ex.toString()}";
      var model = SvgModel(text: errMsg, painter: null);
      state = AsyncData(model);
    }
  }
}

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgCanvasPainter {
  final String title;
  final String svg;
  final PictureInfo pictureInfo;
  final ui.Image image;
  final Uint8List asUint8List;

  SvgCanvasPainter(
      this.title, this.svg, this.pictureInfo, this.image, this.asUint8List) {
    print('SvgCanvasPainter');
  }

  Uint8List getImage() {
    return this.asUint8List;
  }

  void dispose() {
    print('dispose');
    pictureInfo.picture.dispose();
  }

  static Future<SvgCanvasPainter?> loadSvg(
      String title, String svgText, int width, int height) async {
    if (svgText.isEmpty) {
      return null;
    }
    var svgLoader = SvgStringLoader(svgText,
        theme: SvgTheme(currentColor: Colors.deepOrangeAccent),
        colorMapper: MyColorMapper(
            baseColor: Colors.amber, accentColor: Colors.blueAccent));
    final PictureInfo pictureInfo = await vg.loadPicture(svgLoader, null);

    final ui.Image image = await pictureInfo.picture.toImage(width, height);

    final pngBytes = await image.toByteData(format: ImageByteFormat.png);
    if (pngBytes == null) {
      return null;
    }

    return SvgCanvasPainter(
        title, svgText, pictureInfo, image, pngBytes.buffer.asUint8List());
  }
}

class MyColorMapper implements ColorMapper {
  const MyColorMapper({
    required this.baseColor,
    this.accentColor,
  });

  static const _rawBaseColor = Color(0xFF25AFEF);
  static const _rawAccentColor = Color(0xFFFFFFFF);

  final Color baseColor;
  final Color? accentColor;

  @override
  Color substitute(
      String? id, String elementName, String attributeName, Color color) {
    // if (color == _rawBaseColor) return baseColor;
    //
    // final accentColor = this.accentColor;
    // if (accentColor != null && color == _rawAccentColor) return accentColor;
    //
    // return color;
    return baseColor;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/web/layout/size.dart';
import 'package:suzaku/application/web/theme.dart';
import 'package:suzaku/models/svg/state.dart';

class WSvgViewerPartial extends ConsumerWidget {
  const WSvgViewerPartial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<SvgModel> svgModelState = ref.watch(svgModelStateProvider);

    return Container(
      width: STAppTheme.rootFontSize * 24,
      height: STAppTheme.rootFontSize * 12,
      decoration: BoxDecoration(
          border: new Border.all(color: Color(0xFFCCCCCC), width: 1),
          borderRadius: new BorderRadius.circular((4.0))),
      padding: const EdgeInsets.all(0),
      child: switch (svgModelState) {
        AsyncData(:final value) => value.painter != null
            ? Center(
                child: Image.memory(
                  value.painter!.getImage(),
                  fit: BoxFit.contain,
                ),
              )
            : Container(
                padding: EdgeInsets.all(STWebAppTheme.rootFontSize),
                child: Text(
                  value.text,
                  style: TextStyle(fontSize: STAppTheme.rootFontSize),
                ),
              ),
        AsyncError() =>
          const Center(child: Text('Oops, something unexpected happened')),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

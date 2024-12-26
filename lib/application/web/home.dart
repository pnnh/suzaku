import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suzaku/models/tool.dart';
import 'package:suzaku/services/web/tools.dart';

import 'layout/appbar.dart';

class WHomePage extends ConsumerWidget {
  const WHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: WAppBarPartial(),
      body: SafeArea(
        child: DToolGrid(),
      ),
    );
  }
}

class DToolGrid extends ConsumerWidget {
  const DToolGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var toolList = webSelectTools();
    return Container(
      padding: const EdgeInsets.all(32),
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 256.0,
          childAspectRatio: 1.0,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: toolList.map((e) => _ToolCard(e)).toList(),
      ),
    );
  }
}

class _ToolCard extends ConsumerWidget {
  final ToolModel model;

  const _ToolCard(this.model);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Image(image: AssetImage(model.cover)),
          GestureDetector(
            child: Text(model.name),
            onTap: () {
              context.go(model.route);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/pages/files/directory/folders.dart';
import 'package:suzaku/application/desktop/pages/files/quickbar.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';

import 'grid_view.dart';
import 'list_view.dart';

class SKFileDirectoryView extends ConsumerStatefulWidget {
  const SKFileDirectoryView({super.key});

  @override
  ConsumerState<SKFileDirectoryView> createState() =>
      _SKFileDirectoryViewState();
}

class _SKFileDirectoryViewState extends ConsumerState<SKFileDirectoryView> {
  _SKFileDirectoryViewState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          const DFoldersBody(),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SKFileQuickbarView(),
                Expanded(
                    child: ref.watch(listOrGridProvider) == "list"
                        ? SKFileListView()
                        : SKFileGridView())
              ],
            ),
          ))
        ],
      ),
    );
  }
}

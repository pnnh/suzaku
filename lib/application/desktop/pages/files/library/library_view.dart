import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/services/notes/notebook.dart';

import 'note_list.dart';
import 'note_preview.dart';
import 'notebook.dart';

final StateProvider<SKNotebookModel?> glNotebookProvider =
    StateProvider((_) => null);

class SKFileLibraryView extends ConsumerStatefulWidget {
  final String libraryPath;

  const SKFileLibraryView(this.libraryPath, {super.key});

  @override
  ConsumerState<SKFileLibraryView> createState() => _SKFileLibraryViewState();
}

class _SKFileLibraryViewState extends ConsumerState<SKFileLibraryView> {
  _SKFileLibraryViewState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SKLibraryNotebookView(widget.libraryPath),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Row(
              children: [
                SKNoteListView(),
                Expanded(child: SKNotePreviewView())
              ],
            ),
          ))
        ],
      ),
    );
  }
}

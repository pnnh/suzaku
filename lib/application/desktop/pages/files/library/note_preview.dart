import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/services/notes/note.dart';

import 'note_list.dart';

final StateProvider<String> _activeItem = StateProvider((_) => "");

class SKNotePreviewView extends ConsumerStatefulWidget {
  const SKNotePreviewView({super.key});

  @override
  ConsumerState<SKNotePreviewView> createState() => _SKNotePreviewViewState();
}

class _SKNotePreviewViewState extends ConsumerState<SKNotePreviewView> {
  _SKNotePreviewViewState();

  @override
  Widget build(BuildContext context) {
    var currentNote = ref.watch(glNoteProvider);
    if (currentNote == null) {
      return Container(width: 256, child: VSLoading());
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.zero,
      child: FutureBuilder(
        future: mustQueryNote(currentNote.realPath),
        builder: (BuildContext context, AsyncSnapshot<SKNoteModel> snapshot) {
          var fileModel = snapshot.data;
          if (fileModel == null) {
            return const VSLoading();
          }

          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _NotePreviewWidget(fileModel));
        },
      ),
    );
  }
}

class _NotePreviewWidget extends ConsumerWidget {
  final SKNoteModel fileModel;

  _NotePreviewWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      child: Container(
          padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
          child: Text(
            fileModel.content,
            textAlign: TextAlign.left,
          )),
    );
  }
}

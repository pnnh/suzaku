import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suzaku/application/components/loading.dart';
import 'package:suzaku/services/notes/note.dart';

import 'library_view.dart';

final StateProvider<String> _activeItem = StateProvider((_) => "");
final StateProvider<SKNoteModel?> glNoteProvider = StateProvider((_) => null);

class SKNoteListView extends ConsumerStatefulWidget {
  const SKNoteListView({super.key});

  @override
  ConsumerState<SKNoteListView> createState() => _SKNoteListViewState();
}

class _SKNoteListViewState extends ConsumerState<SKNoteListView> {
  _SKNoteListViewState();

  @override
  Widget build(BuildContext context) {
    var currentNotebook = ref.watch(glNotebookProvider);
    if (currentNotebook == null) {
      return Container(width: 256, child: VSLoading());
    }
    return Container(
      width: 256,
      padding: EdgeInsets.zero,
      child: FutureBuilder(
        future: selectNotes(currentNotebook.realPath),
        builder:
            (BuildContext context, AsyncSnapshot<List<SKNoteModel>> snapshot) {
          var fileModels = snapshot.data;
          if (fileModels == null) {
            return const VSLoading();
          }

          return Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: fileModels.map((fileModel) {
                          return _ItemWidget(fileModel);
                        }).toList(),
                      )))
            ],
          );
        },
      ),
    );
  }
}

class _ItemWidget extends ConsumerWidget {
  final SKNoteModel fileModel;
  final StateProvider<bool> openSub = StateProvider<bool>((_) => false);

  _ItemWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            _ItemTitleWidget(
              fileModel,
            ),
          ],
        ));
  }
}

class _ItemTitleWidget extends ConsumerWidget {
  final SKNoteModel fileModel;

  const _ItemTitleWidget(this.fileModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      child: Container(
        color: ref.watch(_activeItem) == fileModel.uid
            ? const Color(0xFFF2F2F2)
            : Colors.transparent,
        padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
        child: Row(
          children: [
            GestureDetector(
              child: Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    "static/images/icons/file.svg",
                    color: const Color(0xffCDCDCD),
                    height: 16,
                    width: 16,
                    //    fit: BoxFit.fitWidth
                  ),
                  SizedBox(
                      width: 120,
                      child: Text(
                        fileModel.name,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ],
              ),
              onTap: () {
                ref.read(glNoteProvider.notifier).update((state) => fileModel);
              },
            )
          ],
        ),
      ),
      onEnter: (event) {
        ref.read(_activeItem.notifier).update((state) => fileModel.uid);
      },
      onExit: (event) {
        ref.read(_activeItem.notifier).update((state) => "");
      },
    );
  }
}

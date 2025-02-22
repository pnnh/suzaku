import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/components/navbar.dart';
import 'package:suzaku/application/desktop/pages/files/state.dart';
import 'package:suzaku/services/notes/notes.dart';

import 'directory_view.dart';
import 'library/library_view.dart';

class DFilesPage extends ConsumerWidget {
  const DFilesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var globalLocation = ref.watch(glLocationProvider);

    var isLibrary = false;
    if (globalLocation != null) {
      isLibrary = isNoteLibrary(globalLocation.realPath);
    }
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            DNavbarComponent(),
            Expanded(
                child: isLibrary
                    ? SKFileLibraryView(globalLocation?.realPath ?? "")
                    : SKFileDirectoryView())
          ],
        ),
      )),
    );
  }
}

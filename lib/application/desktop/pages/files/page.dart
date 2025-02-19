import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/components/navbar.dart';

import 'folders.dart';
import 'list_view.dart';

class DFilesPage extends ConsumerWidget {
  const DFilesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            DNavbarComponent(),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  const DFoldersBody(),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: SKFileListView(),
                  ))
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

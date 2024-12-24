import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/components/navbar.dart';

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
              child: Center(
                child: Text("Files"),
              ),
            ))
          ],
        ),
      )),
    );
  }
}

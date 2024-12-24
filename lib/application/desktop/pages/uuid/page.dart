import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/components/navbar.dart';

class DUUIDPage extends ConsumerWidget {
  const DUUIDPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.white,
      child: Column(
        children: [
          DNavbarComponent(),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Center(
              child: Text("DUUIDPage"),
            ),
          ))
        ],
      ),
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'content.dart';
import 'navbar.dart';

class DHomePage extends ConsumerWidget {
  const DHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              YTWebNavbarWidget(),
              YTWebContentWidget()
            ]
          )
        )
      ),
    );
  }
}

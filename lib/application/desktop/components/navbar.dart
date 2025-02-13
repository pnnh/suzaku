import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DNavbarComponent extends ConsumerWidget {
  const DNavbarComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
            child: GestureDetector(
              onTap: () {
                context.go("/tools");
              },
              child: Image(
                image: AssetImage('static/images/common/global.png'),
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

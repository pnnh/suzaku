import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/application/desktop/components/navbar.dart';
import 'package:suzaku/utils/random.dart';

class WUUIDPage extends ConsumerStatefulWidget {
  const WUUIDPage({super.key});

  @override
  ConsumerState<WUUIDPage> createState() => _DPasswordPageState();
}

class _DPasswordPageState extends ConsumerState<WUUIDPage> {
  final int _length = 12;
  final _myController = TextEditingController(text: "12");
  String _randomString = "xxx";

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '输入长度',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _myController,
                ),
                OutlinedButton(
                    onPressed: () {
                      print("生成密码: ${_myController.text}");
                      var length = int.tryParse(_myController.text);
                      if (length == null) {
                        length = _length;
                      }
                      var randomPassword = generateRandomString(length);
                      print("生成密码2: $randomPassword");
                      setState(() {
                        _randomString = randomPassword;
                      });
                    },
                    child: Text("生成密码")),
                Text(_randomString)
              ],
            ),
          ))
        ],
      ),
    )));
  }
}
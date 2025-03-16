import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quantum/utils/logger.dart';
import 'package:suzaku/config.dart';
import 'package:suzaku/models/home.dart';

Future<HomeResult> queryHome() async {
  var url = Uri.parse('${AppConfig.serverUrl}/articles');
  var response = await http.get(url);
  logger.d('Response status: ${response.statusCode}');
  var decodedResponse =
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  var result = HomeResult.fromJson(decodedResponse);
  return result;
}

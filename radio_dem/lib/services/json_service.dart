import 'dart:convert';
import 'package:flutter/services.dart';

class JsonService {
  static Future<List<dynamic>> loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    return json.decode(data);
  }
}

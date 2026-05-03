import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/error_code.dart';

class DataService {
  static Future<List<ErrorCode>> loadErrors() async {
    final String response =
        await rootBundle.loadString('assets/error_codes.json');

    final List data = json.decode(response);

    return data.map((e) => ErrorCode.fromJson(e)).toList();
  }
}

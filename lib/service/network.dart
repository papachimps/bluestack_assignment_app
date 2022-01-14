import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  final String urlString;

  NetworkService({
    required this.urlString,
  });

  Future getData() async {
    http.Response response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      debugPrint('${response.statusCode}');
    }
  }
}

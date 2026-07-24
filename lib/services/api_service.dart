import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // Backend URL
  static const String baseUrl = "http://192.168.1.72:5000/api/auth";

  // UPDATE PROFILE
  static Future<bool> updateProfile({
    required int id,
    required String name,
    required String phone,
    required String occupation,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl/update-profile"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "name": name,
        "phone": phone,
        "occupation": occupation,
      }),
    );

    return response.statusCode == 200;
  }
}

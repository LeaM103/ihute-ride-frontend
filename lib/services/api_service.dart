import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your computer's IP address
  static const String baseUrl = "http://192.168.1.7:5000/api/auth";

  static Future<bool> updateProfile({
    required int id,
    required String name,
    required String phone,
    required String occupation,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl/update-profile/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "occupation": occupation,
      }),
    );

    return response.statusCode == 200;
  }
}

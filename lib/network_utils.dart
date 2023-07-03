import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static const String apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';
  static Future<String> sendPostRequest(String message, String apiKey) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    final body = jsonEncode({
      'prompt': message,
      'max_tokens': 1000,
    });

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to send API request');
    }
  }
}

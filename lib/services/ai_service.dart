import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AiService {

  static final String _apiKey = dotenv.env['AI_API_KEY'] ?? '';
  static const _url = 'https://api.groq.com/openai/v1/chat/completions';

  static Future<String> getMoodKeyword(String moodInput) async {

    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "llama-3.3-70b-versatile",
          "messages": [
            {
              "role": "system",
              "content": "You are a music curator. Provide exactly ONE musical mood/genre keyword. No prose, no punctuation."
            },
            {
              "role": "user",
              "content": moodInput
            }
          ],
          "temperature": 0.5,
          "max_tokens": 10    
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String aiWord = data['choices'][0]['message']['content'];
        
        return aiWord.trim().toLowerCase();
      } else {
        return "chill"; 
      }
    } catch (e) {
      return "lofi";
    }
  }

}
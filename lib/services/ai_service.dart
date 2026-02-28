import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AiService {
  // static const _apiKey = String.fromEnvironment("apiKey");
  // static const _apiKey = "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";

  static final String _apiKey = dotenv.env['API_KEY'] ?? '';
  
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
          "temperature": 0.5, // Keeps it focused
          "max_tokens": 10    // We only need one word
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String aiWord = data['choices'][0]['message']['content'];
        
        return aiWord.trim().toLowerCase();
      } else {
        return "chill"; // Fallback
      }
    } catch (e) {
      return "lofi"; // Fallback
    }
  }


  // static Future<String> getMoodKeyword(String moodInput) async{

  //   final model = GenerativeModel(
  //     model: 'gemini-1.5-flash', 
  //     apiKey: _apiKey
  //     );

  //   final prompt= '''
  //     The user says: "$moodInput". 
  //     Based on this, provide exactly ONE keyword that represents the musical mood or genre 
  //     suitable for a music search. Return ONLY the word.
  //   ''';

  //   final response = await model.generateContent([Content.text(prompt)]);
  //   return response.text?.trim() ?? 'lofi'; //fallback
    
  // }
}
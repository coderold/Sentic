import 'dart:convert';
import 'package:http/http.dart' as http;

class MusicService{
  static Future<List<dynamic>> searchMusic(String mood) async{
    final url = Uri.parse('https://api.deezer.com/search?q=$mood');
 
    try{
      final response = await http.get(url);

      if (response.statusCode == 200){
        final Map<String, dynamic> data = json.decode(response.body);
        return data['data'];

      }else{
        throw Exception("Tite");
      }

    }catch (e){
      throw Exception('Error: $e');
    }
  }
}
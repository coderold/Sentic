import 'package:flutter/material.dart';
import 'package:sentic/pages/mood_select_page.dart';
import 'package:sentic/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main(){
//   runApp(Sentic());
// }

Future<void> main() async {
  await dotenv.load();
  runApp(const Sentic());
}

class Sentic extends StatelessWidget {
  const Sentic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MoodSelectPage(),
    );
  }
}
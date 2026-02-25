import 'package:flutter/material.dart';
import 'package:sentic/pages/mood_select_page.dart';
import 'package:sentic/theme/app_theme.dart';

void main(){
  runApp(Sentic());
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
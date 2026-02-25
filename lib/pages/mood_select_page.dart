import 'package:flutter/material.dart';
import 'package:sentic/theme/theme_ext.dart';
import 'package:sentic/widgets/mood_textfield.dart';

class MoodSelectPage extends StatefulWidget {
  const MoodSelectPage({super.key});

  @override
  State<MoodSelectPage> createState() => _MoodSelectPageState();
}

class _MoodSelectPageState extends State<MoodSelectPage> {

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sentic',
          style: context.textTheme.headlineLarge,
          ),
      ),

      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 100,
            width: 100,
            
          ),
          Container(
            color: Colors.redAccent,
            height: 100,
            width: 300,
            child: Moodtextfield(
              controller: controller, 
              hint: 'adsdasd'
          ),
          )
        ],
      ),
    ); 
  }
}
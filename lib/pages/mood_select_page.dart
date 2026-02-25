import 'package:flutter/material.dart';
import 'package:sentic/pages/playlist_page.dart';
import 'package:sentic/theme/theme_ext.dart';
import 'package:sentic/widgets/mood_textfield.dart';

class MoodSelectPage extends StatefulWidget {
  const MoodSelectPage({super.key});

  @override
  State<MoodSelectPage> createState() => _MoodSelectPageState();
}

class _MoodSelectPageState extends State<MoodSelectPage> {

  final TextEditingController controller = TextEditingController();
  late String moodInput;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sentic',
          style: context.textTheme.headlineSmall,
          ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 400,
            child: Text(
              'A Flutter AI Mood-Based Playlist Generator App',
              style: context.textTheme.bodyMedium,
            ),
          ),

          Container(
            height: 80,
            width: 300,
            child: Moodtextfield(
              controller: controller, 
              hint: 'Enter mood...'
            ),
          ),

          ElevatedButton(
            onPressed: (){
              setState(() {
                moodInput = controller.text;
              });
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PlaylistPage(),
                )
              );
            }, 
            child: Text('Search Your Music...')
          ),

          Text(controller.text)
        ],
      ),
    ); 
  }
}
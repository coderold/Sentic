import 'package:flutter/material.dart';
import 'package:sentic/theme/theme_ext.dart';
import 'package:sentic/services/ai_service.dart';

class PlaylistPage extends StatelessWidget {
  final String moodInput;

  const PlaylistPage({
    required this.moodInput,
    super.key
    });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Playlist Page',
          style: context.textTheme.headlineSmall,
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Input: $moodInput",
              style: context.textTheme.bodyLarge,
            ),
          ),

          Container(
            alignment: Alignment.center,
            child: FutureBuilder<String>(
              future: AiService.getMoodKeyword(moodInput), // Give it the receipt
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show this while waiting
                }
                // Once it's done, 'snapshot.data' is your real String!
                return Text("AI decided the mood is: ${snapshot.data}");
              },
            ),
          )

        ],
      ),
    );
  }
}
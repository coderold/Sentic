import 'package:flutter/material.dart';
import 'package:sentic/theme/theme_ext.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Playlist Page',
          style: context.textTheme.headlineSmall,
          ),
      ),
    );
  }
}
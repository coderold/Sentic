import 'package:flutter/material.dart';
import 'package:sentic/theme/theme_ext.dart';

class Moodtextfield extends StatelessWidget {

  final TextEditingController controller;
  final String hint;

  const Moodtextfield({
    super.key,
    required this.controller,
    required this.hint
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: context.colorScheme.secondary,
        label: Text(hint)

      ),
      style: context.textTheme.bodyMedium,
    );
  }
}
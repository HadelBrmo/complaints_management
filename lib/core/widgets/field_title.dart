import 'package:flutter/material.dart';
import '../theming/color.dart';

class FieldTitle extends StatelessWidget {
  final String text;

  const FieldTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      ),
    );
  }
}
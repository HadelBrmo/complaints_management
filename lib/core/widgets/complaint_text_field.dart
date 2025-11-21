import 'package:flutter/material.dart';
import '../theming/color.dart';

class ComplaintTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final VoidCallback onChanged;

  const ComplaintTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.greyDark),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.greyMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      onChanged: (_) => onChanged(),
    );
  }
}

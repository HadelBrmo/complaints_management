import 'package:flutter/material.dart';
import '../theming/color.dart';


class ComplaintDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const ComplaintDetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 16 ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "$title :",
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color:AppColors.primary),
          ),
        ],
      ),
    );
  }
}
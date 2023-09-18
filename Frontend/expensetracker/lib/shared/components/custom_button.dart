import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:expensetracker/core/themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return SizedBox(
      width: width * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Palette.WHITE),
          backgroundColor: MaterialStatePropertyAll(Palette.PRIMARY),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

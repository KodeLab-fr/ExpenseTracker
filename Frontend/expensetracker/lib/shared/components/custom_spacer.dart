import 'package:flutter/material.dart';
import 'package:get/get.dart';

///A spacer that takes a percentage of the screen height
class HeightSpacer extends StatelessWidget {
  final double heigth;
  const HeightSpacer({super.key, required this.heigth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:Get.height * heigth);
  }
}

///A spacer that takes a percentage of the screen width
class WidthSpacer extends StatelessWidget {
  final double width;
  const WidthSpacer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:Get.width * width);
  }
}

import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

///All visual elements of the intro screen
class IntroScreen extends GetView {
  final String pathSvg;
  final double heightSvg;
  final double heigthText;
  final String title;
  final String text;

  const IntroScreen({
    super.key,
    required this.pathSvg,
    required this.heightSvg,
    required this.heigthText,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.height * 0.03),
          child: Column(
            children: [
              const HeightSpacer(heigth: 0.2),
              SizedBox(
                height: Get.height * heightSvg,
                child: SvgPicture.asset(
                  pathSvg,
                  fit: BoxFit.contain,
                ),
              ),
              HeightSpacer(heigth: heigthText),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const HeightSpacer(heigth: 0.05),
              SizedBox(
                height: Get.height * 0.1,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  final String pathSvg;
  final double heightSvg;
  final double heitghtText;
  final String title;
  final String text;

  const IntroScreen({
    super.key,
    required this.pathSvg,
    required this.heightSvg,
    required this.heitghtText,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              SizedBox(
                height: height * heightSvg,
                child: SvgPicture.asset(
                  pathSvg,
                  fit: BoxFit.contain,
                ),
              ),
              // SizedBox(height: height * 0.05),
              SizedBox(
                height: height * heitghtText,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 54, 63, 147),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.1,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

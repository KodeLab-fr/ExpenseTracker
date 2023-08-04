import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  final double heightBeforeTitle;
  final String title;
  final double heigthBeforeSvg;
  final String pathSvg;
  final double heightSvg;
  final double heitghtAfterSvg;
  final String message;

  const IntroScreen({
    super.key,
    required this.heigthBeforeSvg,
    required this.pathSvg,
    required this.heightSvg,
    required this.heitghtAfterSvg,
    required this.message,
    required this.heightBeforeTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.03),
          child: Column(
            children: [
              SizedBox(height: height * heightBeforeTitle),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 54, 63, 147),
                ),
              ),
              SizedBox(height: height * heigthBeforeSvg),
              SizedBox(
                height: height * heightSvg,
                child: SvgPicture.asset(pathSvg),
              ),
              SizedBox(height: height * heitghtAfterSvg),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  color: Color.fromARGB(255, 54, 63, 147),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

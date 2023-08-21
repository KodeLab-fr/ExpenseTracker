import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  final String pathSvg;
  final double heightSvg;
  final double heitghtText;
  final String message;

  const IntroScreen({
    super.key,
    required this.pathSvg,
    required this.heightSvg,
    required this.heitghtText,
    required this.message,
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
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * heightSvg,
                child: SvgPicture.asset(pathSvg),
              ),
              SizedBox(
                height: height * heitghtText,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Color.fromARGB(255, 54, 63, 147),
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

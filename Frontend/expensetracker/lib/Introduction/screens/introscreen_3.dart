import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.03),
          child: Column(
            children: [
              SizedBox(height: height * 0.23),
              SizedBox(
                height: height * 0.45,
                child: SvgPicture.asset('assets/svg/auth.svg'),
              ),
              SizedBox(height: height * 0.07),
              const Text(
                'Il ne vous reste plus qu\'à vous authentifier !',
                textAlign: TextAlign.center,
                style: TextStyle(
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.03),
          child: Column(
            children: [
              SizedBox(height: height * 0.20),
              SizedBox(
                height: height * 0.45,
                child: SvgPicture.asset('assets/svg/expenses.svg'),
              ),
              SizedBox(height: height * 0.1),
              const Text(
                'Suivez simplement vos dépenses et établissez plannings et dashboards',
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

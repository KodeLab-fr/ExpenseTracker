import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              'Expense Tracker',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 54, 63, 147),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            SizedBox(
              height: height * 0.4,
              child: SvgPicture.asset('assets/svg/project.svg'),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              'Expense Tracker est avant tout un projet étudiant, tout retour est bienvenu !',
              style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 54, 63, 147),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

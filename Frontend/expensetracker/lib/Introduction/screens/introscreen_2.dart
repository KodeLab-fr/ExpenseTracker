import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.18),
            SizedBox(
              height: height * 0.45,
              child: SvgPicture.asset('assets/svg/expenses.svg'),
            ),
            SizedBox(height: height * 0.1),
            const Text(
              'Vous pourrez suivre vos dépenses et établir plannings et dashboards',
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

import 'package:expensetracker/src/auth/presentation/widgets/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  final height = Get.height;
  final width = Get.width;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: PageView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              if (index == 2) {
                onLastPage = true;
              } else {
                onLastPage = false;
              }
            });
          },
          children: [
            IntroScreen(
              pathSvg: 'assets/svg/project.svg',
              heightSvg: GetPlatform.isDesktop ? 0.45 : 0.35,
              heitghtText: 0.05,
              title: "Un projet étudiant",
              text:
                  "Expense Tracker est avant tout un projet étudiant, tout retour est bienvenu !",
            ),
            IntroScreen(
              pathSvg: 'assets/svg/expenses.svg',
              heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
              heitghtText: 0.1,
              title: "Suivi d'activités",
              text:
                  'Suivez simplement vos dépenses et établissez plannings et dashboards',
            ),
            IntroScreen(
              pathSvg: 'assets/svg/auth.svg',
              heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
              heitghtText: 0.1,
              title: "Compte personnel",
              text: "Il ne vous reste plus qu'à vous authentifier !",
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        height: height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: const Text('Passer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 54, 63, 147),
                  )),
              onTap: () {
                _controller.jumpToPage(2);
              },
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ScrollingDotsEffect(),
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            GestureDetector(
              child: const Text('Suivant',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 54, 63, 147),
                  )),
              onTap: () {
                onLastPage
                    ? Get.toNamed('/auth')
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}

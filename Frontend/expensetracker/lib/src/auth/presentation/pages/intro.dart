import 'package:bankingtool/src/auth/presentation/widget/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'authpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  final double height = MediaQuery.of(Get.context!).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
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
            children: const [
              IntroScreen(
                  heightBeforeTitle: 0.1,
                  title: 'Expense Tracker',
                  heigthBeforeSvg: 0.07,
                  pathSvg: 'assets/svg/project.svg',
                  heightSvg:  0.3,
                  heitghtAfterSvg: 0.1,
                  message:
                      'Expense Tracker est avant tout un projet étudiant, tout retour est bienvenu !'),
              IntroScreen(
                  heightBeforeTitle: 0,
                  title: '',
                  heigthBeforeSvg: 0.2,
                  pathSvg: 'assets/svg/expenses.svg',
                  heightSvg: 0.45,
                  heitghtAfterSvg: 0.1,
                  message:
                      'Suivez simplement vos dépenses et établissez plannings et dashboards'),
              IntroScreen(
                  heightBeforeTitle: 0,
                  title: '',
                  heigthBeforeSvg: 0.23,
                  pathSvg: 'assets/svg/auth.svg',
                  heightSvg: 0.45,
                  heitghtAfterSvg: 0.07,
                  message: 'Il ne vous reste plus qu\'à vous authentifier !')
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: height * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  onDotClicked: (index) {
                    _controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
                GestureDetector(
                  child: const Text('Suivant',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 54, 63, 147),
                      )),
                  onTap: () {
                    onLastPage
                        ? Get.to(const AuthPage(),
                            duration: const Duration(milliseconds: 700))
                        : _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

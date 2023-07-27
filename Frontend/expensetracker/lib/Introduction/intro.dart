import 'package:bankingtool/Introduction/screens/introscreen_1.dart';
import 'package:bankingtool/Introduction/screens/introscreen_2.dart';
import 'package:bankingtool/Introduction/screens/introscreen_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/authpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
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
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
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
                  onLastPage
                      ? GestureDetector(
                          child: const Text('Terminé',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 54, 63, 147),
                              )),
                          onTap: () {
                            Get.to(const AuthPage(),
                                duration: const Duration(milliseconds: 700));
                          },
                        )
                      : GestureDetector(
                          child: const Text('Suivant',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 54, 63, 147),
                              )),
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        )
                ],
              ))
        ],
      ),
    );
  }
}

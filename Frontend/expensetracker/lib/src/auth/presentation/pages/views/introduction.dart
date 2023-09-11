import 'package:expensetracker/core/config.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends GetView<PageController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    var onLastPage = false;
    final height = Get.height;
    final width = Get.width;
    return EnvironmentsBadge(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: PageView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              if (index == 2) {
                onLastPage = true;
              } else {
                onLastPage = false;
              }
            },
            children: [
              IntroScreen(
                pathSvg: 'assets/svg/project.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.35,
                heitghtText: 0.05,
                title: 'intro-1_title'.tr,
                text: 'intro-1_text'.tr,
              ),
              IntroScreen(
                pathSvg: 'assets/svg/expenses.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
                heitghtText: 0.1,
                title: 'intro-2_title'.tr,
                text: 'intro-2_text'.tr,
              ),
              IntroScreen(
                pathSvg: 'assets/svg/auth.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
                heitghtText: 0.1,
                title: 'intro-3_title'.tr,
                text: 'intro-3_text'.tr,
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
                child: Text('intro-skip'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 54, 63, 147),
                    )),
                onTap: () {
                  controller.jumpToPage(2);
                },
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(),
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
              GestureDetector(
                child: Text('intro-next'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 54, 63, 147),
                    )),
                onTap: () {
                  onLastPage
                      ? Get.toNamed('/auth')
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

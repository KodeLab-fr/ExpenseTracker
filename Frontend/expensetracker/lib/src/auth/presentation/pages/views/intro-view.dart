import 'package:expensetracker/core/config.dart';
import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

///The main view of the intro module, host the intro screens
class IntroView extends GetView<PageController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    var onLastPage = false;
    return EnvironmentsBadge(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: Get.height * 0.1),
          child: PageView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              onLastPage = index == 2;
            },
            children: [
              IntroScreen(
                pathSvg: 'assets/svg/project.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.35,
                heigthText: 0.05,
                title: Adresses.INTRO_VIEW_1_TITLE.tr,
                text: Adresses.INTRO_VIEW_1_CONTENT.tr,
              ),
              IntroScreen(
                pathSvg: 'assets/svg/expenses.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
                heigthText: 0.1,
                title: Adresses.INTRO_VIEW_2_TITLE.tr,
                text: Adresses.INTRO_VIEW_2_CONTENT.tr,
              ),
              IntroScreen(
                pathSvg: 'assets/svg/auth.svg',
                heightSvg: GetPlatform.isDesktop ? 0.45 : 0.3,
                heigthText: 0.1,
                title: Adresses.INTRO_VIEW_3_TITLE.tr,
                text: Adresses.INTRO_VIEW_3_CONTENT.tr,
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          height: Get.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Text(
                  Adresses.INTRO_VIEW_SKIP.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
                child: Text(
                  Adresses.INTRO_VIEW_NEXT.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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

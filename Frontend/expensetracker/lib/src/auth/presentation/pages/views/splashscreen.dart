import 'package:expensetracker/core/config.dart';
import 'package:expensetracker/src/auth/presentation/controllers/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return FutureBuilder(
        future: controller.initRoutes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else {
            return waitingView();
          }
        });
  }

  EnvironmentsBadge waitingView() {
    return EnvironmentsBadge(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset('assets/svg/default.svg')
          ]),
        ),
      ),
    );
  
  }
}

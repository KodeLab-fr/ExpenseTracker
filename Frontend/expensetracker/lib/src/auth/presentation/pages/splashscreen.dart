import 'package:expensetracker/shared/config.dart';
import 'package:expensetracker/src/auth/presentation/controllers/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    final height = Get.height;
    return EnvironmentsBadge(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 54, 63, 147),
                Color.fromARGB(255, 189, 101, 220),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.monetization_on,
              color: Colors.white,
              size: height * 0.15,
            ),
            SizedBox(height: height * 0.03),
            Text(
              'splash-title'.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontStyle: FontStyle.italic,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/src/auth/presentation/controllers/server_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ServerDownView extends GetView<ServerDownController> {
  const ServerDownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Center(
              child: Column(children: [
                SizedBox(height: Get.height * 0.2),
                SizedBox(
                  height: Get.height * 0.3,
                  child: SvgPicture.asset('assets/svg/no_response.svg'),
                ),
                SizedBox(height: Get.height * 0.09),
                Text(
                  'server_down-title'.tr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF363f93),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Text('server_down-text'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: Get.height * 0.04),
                CustomButton(
                    text: 'server_down-button'.tr,
                    onPressed: () {
                      controller.loading();
                    }),
              ]),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.obscureScreen,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

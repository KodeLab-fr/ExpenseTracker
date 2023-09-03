import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/src/auth/presentation/controllers/network.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NetworkView extends GetView<NetworkController> {
  const NetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(children: [
              SizedBox(height: height * 0.2),
              SizedBox(
                height: height * 0.3,
                child: SvgPicture.asset('assets/svg/no_wifi.svg'),
              ),
              SizedBox(height: height * 0.09),
              Text(
                'network-title'.tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF363f93),
                ),
              ),
              SizedBox(height: height * 0.03),
              Text('network-text'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(height: height * 0.04),
              CustomButton(
                  text: 'network-button'.tr,
                  onPressed: () {
                    controller.loading();
                  }),
            ]),
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

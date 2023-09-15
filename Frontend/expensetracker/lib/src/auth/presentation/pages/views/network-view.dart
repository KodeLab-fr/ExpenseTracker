import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:expensetracker/src/auth/presentation/controllers/network-controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NetworkView extends GetView<NetworkController> {
  const NetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(children: [
              const HeightSpacer(heigth: 0.2),
              SizedBox(
                height: Get.height * 0.3,
                child: SvgPicture.asset('assets/svg/no_wifi.svg'),
              ),
              const HeightSpacer(heigth: 0.09),
              Text(
                'network-title'.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const HeightSpacer(heigth: 0.03),
              Text(
                'network-text'.tr,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const HeightSpacer(heigth: 0.04),
              CustomButton(
                text: 'network-button'.tr,
                onPressed: controller.loading,
              ),
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

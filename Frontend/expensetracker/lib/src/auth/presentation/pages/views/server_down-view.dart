import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:expensetracker/src/auth/presentation/controllers/server_down-controller.dart';
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
              child: Column(
                children: [
                  const HeightSpacer(heigth: 0.2),
                  SizedBox(
                    height: Get.height * 0.3,
                    child: SvgPicture.asset('assets/svg/no_response.svg'),
                  ),
                  const HeightSpacer(heigth: 0.09),
                  Text(
                    'server_down-title'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const HeightSpacer(heigth: 0.03),
                  Text(
                    'server_down-text'.tr,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const HeightSpacer(heigth: 0.04),
                  CustomButton(
                    text: 'server_down-button'.tr,
                    onPressed: controller.loading,
                  ),
                ],
              ),
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

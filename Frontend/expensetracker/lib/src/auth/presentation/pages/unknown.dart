import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UnknownPage extends GetView {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: height * 0.2),
          SizedBox(
            height: height * 0.3,
            child: SvgPicture.asset('assets/svg/404.svg'),
          ),
          SizedBox(height: height * 0.09),
          Text(
            'unknown-title'.tr,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF363f93),
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            'unknown-text'.tr,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black38,
            ),
          ),
          SizedBox(height: height * 0.04),
          CustomButton(
              text: 'unknown-button'.tr,
              onPressed: () {
                Get.offAllNamed('/auth');
              }),
        ]),
      ),
    );
  }
}

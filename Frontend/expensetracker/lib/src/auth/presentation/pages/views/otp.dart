import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/shared/config.dart';
import 'package:expensetracker/src/auth/presentation/controllers/code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpView extends GetView<CodeController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return EnvironmentsBadge(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black38,
            ),
            onPressed: () {
              controller.reset();
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.3,
              child: SvgPicture.asset('assets/svg/otp.svg'),
            ),
            SizedBox(height: height * 0.05),
            Text(
              'otp-title'.tr,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF363f93),
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                'otp-text'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Center(
              child: Pinput(
                controller: controller.code,
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: width * 0.11,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF363f93),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF363f93),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            SizedBox(
              height: height * 0.06,
              child: CustomButton(
                text: 'otp-button'.tr,
                onPressed: () {
                  controller.verifyCode();
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            GestureDetector(
              onTap: () {
                controller.resendCode();
              },
              child: Text(
                'otp-resend'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

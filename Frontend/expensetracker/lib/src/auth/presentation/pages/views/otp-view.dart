import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/core/config.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:expensetracker/src/auth/presentation/controllers/otp-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return EnvironmentsBadge(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Palette.DUST_LIGTH,
            ),
            onPressed: () {
              controller.reset();
              Get.back();
            },
          ),
          backgroundColor: Palette.TRANSPARENT,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.3,
              child: SvgPicture.asset('assets/svg/otp.svg'),
            ),
            const HeightSpacer(heigth: 0.05),
            Text(
              'otp-title'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const HeightSpacer(heigth: 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Text(
                'otp-text'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const HeightSpacer(heigth: 0.04),
            Center(
              child: Pinput(
                controller: controller.code,
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: Get.width * 0.11,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                    color: Palette.WHITE,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Palette.PRIMARY,
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Palette.DUST_DARK,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  textStyle: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            const HeightSpacer(heigth: 0.04),
            SizedBox(
              height: Get.height * 0.06,
              child: CustomButton(
                text: 'otp-button'.tr,
                onPressed: controller.verifyCode,
              ),
            ),
            const HeightSpacer(heigth: 0.03),
            GestureDetector(
              onTap: controller.resendCode,
              child: Text(
                'otp-resend'.tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

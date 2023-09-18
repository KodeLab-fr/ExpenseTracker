import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

///This view is displayed when the user tries to access an unknown route 
class UnknownView extends GetView {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Center(
          child: Column(children: [
            const HeightSpacer(heigth: 0.2),
            SizedBox(
              height: Get.height * 0.3,
              child: SvgPicture.asset('assets/svg/404.svg'),
            ),
            const HeightSpacer(heigth: 0.09),
            Text(
              Adresses.UNKNOWN_VIEW_TITLE.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const HeightSpacer(heigth: 0.03),
            Text(
              Adresses.UNKNOWN_VIEW_CONTENT.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const HeightSpacer(heigth: 0.04),
            CustomButton(
              text: Adresses.UNKNOWN_VIEW_BUTTON.tr,
              onPressed: Get.back,
            ),
          ]),
        ),
      ),
    );
  }
}

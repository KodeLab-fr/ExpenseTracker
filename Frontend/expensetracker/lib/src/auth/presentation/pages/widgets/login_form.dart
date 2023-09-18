import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/login-controller.dart';

///All visual elements of the sign in form
class LoginForm extends GetView<LoginController> {
  final VoidCallback toggleForm;
  const LoginForm({super.key, required this.toggleForm});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.globalFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpacer(heigth: 0.1),
          SizedBox(
            height: Get.height * 0.08,
            child: Text(
              Adresses.APP_NAME_WITH_APP.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Text(
            Adresses.LOGIN_FORM_VIEW_TITLE.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const HeightSpacer(heigth: 0.08),
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.person),
              labelText: Adresses.LOGIN_FORM_VIEW_ID.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return Adresses.LOGIN_FORM_VIEW_ID_VALIDATOR.tr;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const HeightSpacer(heigth: 0.02),
          Obx(() => TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.lock),
                  labelText: Adresses.LOGIN_FORM_VIEW_PASSWORD.tr,
                  suffixIcon: IconButton(
                    onPressed: controller.toggle,
                    icon: controller.obscureText
                        ? const Icon(CupertinoIcons.eye)
                        : const Icon(CupertinoIcons.eye_slash),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                autocorrect: false,
                obscureText: controller.obscureText,
                validator: (value) {
                  if (value!.length < 8) {
                    return Adresses.LOGIN_FORM_VIEW_PASSWORD_VALIDATOR.tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )),
          const HeightSpacer(heigth: 0.03),
          Row(children: [
            Text(
              Adresses.LOGIN_FORM_VIEW_NO_ACCOUNT.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            GestureDetector(
              onTap: toggleForm,
              child: Text(
                Adresses.LOGIN_FORM_VIEW_SWITCH.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ]),
          const HeightSpacer(heigth: 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Adresses.LOGIN_FORM_VIEW_BUTTON.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ElevatedButton(
                onPressed: controller.login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.PRIMARY,
                  padding: EdgeInsets.all(Platform.isMacOS ? 20 : 15),
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: Platform.isMacOS ? 45 : 30,
                  color: Palette.WHITE,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

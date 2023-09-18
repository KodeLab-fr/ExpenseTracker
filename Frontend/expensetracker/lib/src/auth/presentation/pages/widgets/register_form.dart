import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/register-controller.dart';

///Register form
class RegisterForm extends GetView<RegisterController> {
  final VoidCallback toggleForm;
  const RegisterForm({
    super.key,
    required this.toggleForm,
  });

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
            Adresses.REGISTER_FORM_VIEW_TITLE.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const HeightSpacer(heigth: 0.08),
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.person),
              labelText: Adresses.REGISTER_FORM_VIEW_NAME.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return Adresses.REGISTER_FORM_VIEW_NAME_VALIDATOR.tr;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const HeightSpacer(heigth: 0.02),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.mail),
              labelText: Adresses.REGISTER_FORM_VIEW_EMAIL.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return Adresses.REGISTER_FORM_VIEW_EMAIL_VALIDATOR.tr;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const HeightSpacer(heigth: 0.02),
          Obx(() => TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: Adresses.REGISTER_FORM_VIEW_PASSWORD.tr,
                  prefixIcon: const Icon(CupertinoIcons.lock),
                  suffixIcon: IconButton(
                    onPressed: controller.toggle,
                    icon: controller.obscureText
                        ? const Icon(CupertinoIcons.eye)
                        : const Icon(CupertinoIcons.eye_slash),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                obscureText: controller.obscureText,
                autocorrect: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Adresses.REGISTER_FORM_VIEW_PASSWORD_VALIDATOR.tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )),
          const HeightSpacer(heigth: 0.03),
          Row(children: [
            Text(
              Adresses.REGISTER_FORM_VIEW_ALREADY_ACCOUNT.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            GestureDetector(
              onTap: toggleForm,
              child: Text(
                Adresses.REGISTER_FORM_VIEW_SWITCH.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ]),
          const HeightSpacer(heigth: 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Adresses.REGISTER_FORM_VIEW_BUTTON.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: controller.register,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(Platform.isMacOS ? 20 : 15),
                  backgroundColor: Palette.PRIMARY,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Palette.WHITE,
                  size: Platform.isMacOS ? 45 : 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

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
              'app-title'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Text(
            'login-title'.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const HeightSpacer(heigth: 0.08),
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.person),
              labelText: 'login-id'.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return 'login-id_validator'.tr;
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
                  labelText: 'login-password'.tr,
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
                    return 'login-password_validator'.tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )),
          const HeightSpacer(heigth: 0.03),
          Row(children: [
            Text(
              'login-no_account'.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            GestureDetector(
              onTap: toggleForm,
              child: Text(
                'login-text'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ]),
          const HeightSpacer(heigth: 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'login-button'.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ElevatedButton(
                onPressed: controller.login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF363f93),
                  padding: EdgeInsets.all(Platform.isMacOS ? 20 : 15),
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: Platform.isMacOS ? 45 : 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

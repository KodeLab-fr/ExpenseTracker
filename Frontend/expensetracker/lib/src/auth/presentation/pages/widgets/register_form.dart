import 'package:expensetracker/shared/components/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/register-controller.dart';

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
              'app-title'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Text(
            'register-title'.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const HeightSpacer(heigth: 0.08),
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.person),
              labelText: 'register-name'.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return 'register-name_validator'.tr;
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
              labelText: 'register-email'.tr,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            autocorrect: false,
            validator: (value) {
              if (value!.length < 3) {
                return 'register-email_validator'.tr;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const HeightSpacer(heigth: 0.02),
          Obx(() => TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: 'register-password'.tr,
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
                    return 'register-password_validator'.tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )),
          const HeightSpacer(heigth: 0.03),
          Row(children: [
            Text(
              'register-already_account'.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            GestureDetector(
              onTap: toggleForm,
              child: Text(
                'register-text'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ]),
          const HeightSpacer(heigth: 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'register-button'.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: controller.register,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(Platform.isMacOS ? 20 : 15),
                  backgroundColor: const Color(0xFF363f93),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
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

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
    final height = Get.height;
    return Form(
      key: controller.globalFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.1),
          SizedBox(
            height: height * 0.08,
            child: Text(
              'app-title'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93),
              ),
            ),
          ),
          Text(
            'login-title'.tr,
            style: TextStyle(
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93)),
          ),
          SizedBox(height: height * 0.08),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.nameController,
            autocorrect: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.person),
              labelText: 'login-id'.tr,
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'login-id_validator'.tr;
              }
              return null;
            },
            maxLength: 30,
          ),
          Obx(() => TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.passwordController,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.lock),
                  labelText: 'login-password'.tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.toggle();
                    },
                    icon: controller.obscureText
                        ? const Icon(CupertinoIcons.eye)
                        : const Icon(CupertinoIcons.eye_slash),
                  ),
                ),
                validator: (value) {
                  if (value!.length < 8) {
                    return 'login-password_validator'.tr;
                  }
                  return null;
                },
                obscureText: controller.obscureText,
              )),
          SizedBox(height: height * 0.03),
          Row(children: [
            Text(
              'login-no_account'.tr,
              style: const TextStyle(color: Colors.black38),
            ),
            GestureDetector(
              onTap: () {
                toggleForm();
              },
              child: Text(
                'login-text'.tr,
                style: const TextStyle(color: Color(0xFF363f93)),
              ),
            ),
          ]),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'login-button'.tr,
                style: TextStyle(
                    fontSize: Platform.isMacOS ? 35 : 28,
                    color: const Color(0xFF363f93)),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
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
          )
        ],
      ),
    );
  }
}

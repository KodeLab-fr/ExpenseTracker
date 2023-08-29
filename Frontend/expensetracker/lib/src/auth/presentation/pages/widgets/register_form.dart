import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/register.dart';

class RegisterForm extends GetView<RegisterController> {
  final VoidCallback toggleForm;
  const RegisterForm({super.key, required this.toggleForm});

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
            'register-title'.tr,
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
              prefixIcon: const Icon(Icons.person),
              labelText: 'register-name'.tr,
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'register-name_validator'.tr;
              }
              return null;
            },
            maxLength: 25,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.emailController,
            autocorrect: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: 'register-email'.tr,
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'register-email_validator'.tr;
              }
              return null;
            },
            maxLength: 25,
          ),
          Obx(() => TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.passwordController,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'register-password'.tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.toggle();
                    },
                    icon: controller.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'register-password_validator'.tr;
                  }
                  return null;
                },
                obscureText: controller.obscureText,
              )),
          SizedBox(height: height * 0.03),
          Row(children: [
            Text('register-have_account'.tr,
                style: const TextStyle(color: Colors.black38)),
            GestureDetector(
              onTap: () {
                toggleForm();
              },
              child: Text(
                'register-text'.tr,
                style: const TextStyle(color: Color(0xFF363f93)),
              ),
            ),
          ]),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'register-button'.tr,
                style: TextStyle(
                    fontSize: Platform.isMacOS ? 35 : 28,
                    color: const Color(0xFF363f93)),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.register();
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

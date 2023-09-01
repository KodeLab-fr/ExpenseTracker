import 'package:expensetracker/shared/config.dart';
import 'package:expensetracker/src/auth/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/login_form.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/register_form.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return EnvironmentsBadge(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: controller.isRegisterFormVisible
                    ? RegisterForm(toggleForm: controller.toggleForm)
                    : LoginForm(toggleForm: controller.toggleForm),
              );
            }),
            Obx(() {
              return Visibility(
                visible: controller.obscureScreen,
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

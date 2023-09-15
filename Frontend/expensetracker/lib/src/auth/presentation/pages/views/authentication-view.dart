import 'package:expensetracker/core/config.dart';
import 'package:expensetracker/src/auth/presentation/controllers/authentication-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/login_form.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/register_form.dart';

///The main view of the authentication module, host the login and register forms
class AuthenticationView extends GetView<AuthController> {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return EnvironmentsBadge(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
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

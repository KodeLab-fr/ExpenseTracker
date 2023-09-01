import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/data/log_repo_impl.dart';

class CodeController extends GetxController {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  TextEditingController code = TextEditingController();

  ///Clear all the text fields
  void reset() {
    code.clear();
  }

  ///Resend the code to the user
  Future<void> resendCode() async {
    final response = await _logRepoImplementation.resendCode();
    response.fold((left) {
      left.showErrorSnackBar();
    }, (right) {
      final responseModel = ResponseModel.fromJson(right.body);
      if (responseModel.code == 0) {
        Get.snackbar(
          'send_code-title'.tr,
          'send_code-body'.tr,
          backgroundColor: const Color(0xFF363f93),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        );
      }
    });
  }

  ///Verify the code given in the text field
  Future<void> verifyCode() async {
    final response = await _logRepoImplementation.verifyCode(code.text);
    response.fold((left) {
      reset();
      left.showErrorSnackBar();
    }, (right) {
      reset();
      final responseModel = ResponseModel.fromJson(right.body);
      if (responseModel.code == 0) {
        Get.snackbar(
          'create_account-title'.tr,
          'create_account-body'.tr,
          backgroundColor: const Color.fromARGB(255, 54, 147, 90),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        Get.offAllNamed('/home');
      }
    });
  }
}

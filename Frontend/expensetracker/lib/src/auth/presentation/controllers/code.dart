import 'package:expensetracker/shared/components/errors.dart';
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

  //create a function to send the code again using resendCode method
  Future<void> resendCode() async {
    try {
      final response = await _logRepoImplementation.resendCode();
      if (response.statusCode == 202) {
        final responseModel = ResponseModel.fromJson(response.body);
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
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      ErrorManager().showErrorSnackBar(error);
    }
  }

  ///Verify the code given in the text field
  Future<void> verifyCode() async {
    try {
      final response = await _logRepoImplementation.verifyCode(code.text);
      if (response.statusCode == 202) {
        final responseModel = ResponseModel.fromJson(response.body);
        if (responseModel.code == 0) {
          Get.snackbar(
            'create_account-title'.tr,
            'create_account-body'.tr,
            backgroundColor: const Color.fromARGB(255, 54, 147, 90),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
          );
          dispose();
          Get.offAllNamed('/form');
        }
      } else {
        throw Exception(response.body ?? 'no_response_server'.tr);
      }
    } catch (error) {
      reset();
      ErrorManager().showErrorDialog(error);
    }
  }
}

import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:expensetracker/shared/models/server_response_model.dart';
import 'package:expensetracker/src/auth/data/log-repo_impl.dart';

///Controller for the OTP screen
class OtpController extends GetxController {
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
      if (left.code == 401) {
        Failure(Adresses.OTP_CONT_RESEND_401.tr, 401).showErrorSnackBar();
      } else if (left.code == 404) {
        Failure(Adresses.OTP_CONT_RESEND_404.tr, 404).showErrorSnackBar();
      } else if (left.code == 502) {
        Get.offAllNamed('/down');
      } else if (left.code == 418) {
        Get.offAllNamed('/noconnexion');
      } else {
        Get.offAllNamed('/notfound');
      }
    }, (right) {
      final responseModel = ServerResponseModel.fromJson(right.body);
      if (responseModel.code == 0) {
        Get.snackbar(
          Adresses.OTP_CONT_RESEND_TITLE.tr,
          Adresses.OTP_CONT_RESEND_CONTENT.tr,
          backgroundColor: Palette.PRIMARY,
          colorText: Palette.WHITE,
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
      if (left.code == 401) {
        Failure(Adresses.OTP_CONT_SEND_401.tr, 401).showErrorSnackBar();
      } else if (left.code == 402) {
        Failure(Adresses.OTP_CONT_SEND_402.tr, 402).showErrorSnackBar();
      } else if (left.code == 404) {
        Failure(Adresses.OTP_CONT_SEND_404.tr, 404).showErrorSnackBar();
      } else if (left.code == 502) {
        Get.offAllNamed('/down');
      } else if (left.code == 418) {
        Get.offAllNamed('/noconnexion');
      } else {
        Get.offAllNamed('/notfound');
      }
    }, (right) {
      reset();
      final responseModel = ServerResponseModel.fromJson(right.body);
      if (responseModel.code == 0) {
        Get.snackbar(
          Adresses.OTP_CONT_SEND_TITLE.tr,
          Adresses.OTP_CONT_SEND_CONTENT.tr,
          backgroundColor: Palette.SUCCESS,
          colorText: Palette.WHITE,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        Get.offAllNamed('/nav');
      }
    });
  }
}

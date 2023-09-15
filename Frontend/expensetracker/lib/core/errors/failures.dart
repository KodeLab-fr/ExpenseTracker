import 'package:expensetracker/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Failure {
  final Object error;
  final int? code;
  const Failure( this.error, this.code);

  /// Show a dialog with the error message
  void showErrorDialog() {
    Get.defaultDialog(
      title: 'error-title'.tr,
      titlePadding: const EdgeInsets.only(top: 14, bottom: 10),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(error.toString().replaceAll('Exception: ', '')),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'ok'.tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  /// Show a snackbar with the error message
  void showErrorSnackBar() {
    Get.snackbar(
      'error-title'.tr,
      error.toString().replaceAll('Exception: ', ''),
      backgroundColor: Palette.ERROR,
      colorText: Palette.WHITE,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }
}

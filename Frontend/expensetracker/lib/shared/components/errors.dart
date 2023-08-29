import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ErrorManager {
  /// Show a dialog with the error message
  void showErrorDialog(Object error) {
    Get.defaultDialog(
      title: 'error_title'.tr,
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
  void showErrorSnackBar(Object error) {
    Get.snackbar(
      'Erreur survenue',
      error.toString().replaceAll('Exception: ', ''),
      backgroundColor: const Color(0xFFE57373),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }
}

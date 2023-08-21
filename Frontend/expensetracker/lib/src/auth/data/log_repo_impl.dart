import 'package:expensetracker/src/auth/domain/models/login_response.dart';
import 'package:expensetracker/src/auth/domain/models/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

class LoginController extends GetxController with CacheManager {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //safety method, getx should automatically dispose controllers when they are not used
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    final connect = GetConnect();
    SignInInfo requestModel = SignInInfo(
      name: nameController.text,
      password: passwordController.text,
    );

    try {
      final response = await connect.get(
        '${dotenv.env['API_URL']}/auth',
        headers: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        saveToken(responseModel.message);
        dispose();
        Get.toNamed('/form');
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Erreur survenue"),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

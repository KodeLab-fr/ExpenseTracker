import 'dart:convert';
import 'package:bankingtool/src/forms/presentation/pages/formpage.dart';
import 'package:bankingtool/src/auth/domain/entities/login_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../consts.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clear() {
    nameController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    LoginRequestModel requestModel = LoginRequestModel(
      name: nameController.text,
      password: passwordController.text,
    );
    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['API_URL']}/login'),
        headers: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        final responseModel = LoginResponseModel.fromJson(response.body);
        box.write('token', responseModel.token);
        box.write('name', requestModel.name);
        box.write('password', requestModel.password);
        clear();
        Get.to(
          const FormPage(),
          duration: const Duration(milliseconds: 700),
        );
      } else {
        throw jsonDecode(response.body)["message"] ?? "Erreur inconnue";
      }
    } catch (error) {
      // ! : à supprimer dès que fonctionnel
      box.write('name', requestModel.name);
      clear();
      Get.to(() => const FormPage());
      // ! : à supprimer dès que fonctionnel

      // TODO : à changer dès que fonctionnel
      // showDialog(
      //   context: Get.context!,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      // TODO : à changer avec le retour de l'api
      //       title: const Text("Erreur survenue"),
      //       content: Text(error.toString()),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Get.back();
      //           },
      //           child: const Text("OK"),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }
}

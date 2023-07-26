import 'package:bankingtool/Constants/consts.dart';
import 'package:bankingtool/models/expense_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class FormController extends GetxController {
  TextEditingController typeController = TextEditingController();
  TextEditingController contextController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void clear() {
    typeController.clear();
    contextController.clear();
    dateController.clear();
    costController.clear();
    locationController.clear();
    descriptionController.clear();
  }

  Future<void> pushData() async {
    // ! : à supprimer dès que fonctionnel
    // ignore: avoid_print
    print(typeController.text);
    // ignore: avoid_print
    print(contextController.text);
    // ignore: avoid_print
    print(dateController.text);

    // ignore: avoid_print
    print(costController.text);
    // ignore: avoid_print
    print(locationController.text);
    // ignore: avoid_print
    print(descriptionController.text);
    clear();
    // ! : à supprimer dès que fonctionnel

    ExpenseRequestModel requestModel = ExpenseRequestModel(
      name: box.read('name'),
      type: typeController.text,
      context: contextController.text,
      date: dateController.text,
      cost: costController.text,
      location: locationController.text,
      description: descriptionController.text,
    );

    try {
      // TODO : vérifier que ça marche
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/submit_expense_form'),
        body: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        // TODO : remplir
      } else {
        throw jsonDecode(response.body)["message"] ?? "Erreur inconnue";
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

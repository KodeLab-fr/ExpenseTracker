// import 'package:expensetracker/shared/cache/storage.dart';
// import 'package:expensetracker/src/forms/domain/entities/expense_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'dart:convert';

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
    // ! : à changer dès que fonctionnel
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Formulaire soumis !"),
          content: Text(
            "Type : ${typeController.text}\n"
            "Contexte : ${contextController.text}\n"
            "Date : ${dateController.text}\n"
            "Coût : ${costController.text}\n"
            "Lieu : ${locationController.text}\n"
            "Description : ${descriptionController.text}\n",
          ),
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
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text(
          'Formulaire soumis.',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Color.fromARGB(255, 54, 63, 147),
        duration: Duration(milliseconds: 750),
      ),
    );
    clear();
    // ! : à changer dès que fonctionnel

    // ExpenseRequestModel requestModel = ExpenseRequestModel(
    //   name: box.read('name'),
    //   type: typeController.text,
    //   context: contextController.text,
    //   date: dateController.text,
    //   cost: costController.text,
    //   location: locationController.text,
    //   description: descriptionController.text,
    // );

    // try {
    //   // TODO : vérifier que ça marche
    //   final response = await http.post(
    //     Uri.parse('${dotenv.env['API_URL']}/submit_expense_form'),
    //     body: requestModel.toJson(),
    //   );
    //   if (response.statusCode == 200) {
    //     // TODO : remplir
    //   } else {
    //     throw jsonDecode(response.body)["message"] ?? "Erreur inconnue";
    //   }
    // } catch (error) {
    //   showDialog(
    //     context: Get.context!,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text("Erreur survenue"),
    //         content: Text(error.toString()),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Get.back();
    //             },
    //             child: const Text("OK"),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }
}

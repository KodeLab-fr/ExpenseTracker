import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  }
}

import 'package:bankingtool/FormPage/custom_formfield.dart';
import 'package:flutter/material.dart';
import 'package:bankingtool/Controllers/form_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> globalFormKey1 = GlobalKey<FormState>();
  final FormController _expenseFormController = Get.put(FormController());

  final _flowType = [
    "Dépense",
    "Crédit",
  ];
  String? _selectedFlowType = "Dépense";

  final _contexte = [
    "Alimentaire",
    "Perso",
    "Pro",
    "Info",
    "Autre",
  ];
  String? _selectedContexte = "Alimentaire";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil",
            style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: const Color(0xFF363f93),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        child: ListView(
          children: [
            SizedBox(height: height * 0.1),
            const Text(
              'Veuillez choisir un formulaire à remplir :',
              style: TextStyle(fontSize: 40, color: Color(0xFF363f93)),
            ),
            SizedBox(height: height * 0.05),
            ExpansionTile(
              title: const Text('Ajouter une ligne'),
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Image(image: AssetImage('assets/img/logo_depense.png')),
              ),
              children: [
                Form(
                  key: globalFormKey1,
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        value: _selectedFlowType,
                        items: _flowType
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedFlowType = value as String;
                          });
                        },
                        onSaved: (newValue) {
                          _expenseFormController.typeController.text =
                              newValue as String;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer le type d\'action';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Type de flux',
                          hintText: 'Exemple : Dépense',
                          prefixIcon: Icon(Icons.compare_arrows_rounded),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: _selectedContexte,
                        items: _contexte
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedContexte = value as String;
                          });
                        },
                        onSaved: (newValue) {
                          _expenseFormController.contextController.text =
                              newValue as String;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer une catégorie';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Contexte',
                          hintText: 'Exemple : Personnel',
                          prefixIcon: Icon(Icons.tag),
                        ),
                      ),
                      CustTextFormField(
                        controller: _expenseFormController.dateController,
                        prefixIcon: const Icon(Icons.calendar_month),
                        labelText: 'Entrez la date de la transaction',
                        hintText: 'Exemple : 22/11/2023',
                        errorText: 'Veuillez entrer une date',
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now());
                          if (date != null) {
                            _expenseFormController.dateController.text =
                                DateFormat('dd/MM/yyyy').format(date);
                          }
                        },
                      ),
                      CustTextFormField(
                          controller: _expenseFormController.costController,
                          prefixIcon: const Icon(Icons.euro),
                          labelText: 'Entrez le montant',
                          hintText: 'Exemple : 10,00',
                          errorText: 'Veuillez entrer un montant'),
                      CustTextFormField(
                          controller: _expenseFormController.locationController,
                          prefixIcon: const Icon(Icons.location_on),
                          labelText: 'Entrez le lieu de la transaction',
                          hintText: 'Exemple : restaurant',
                          errorText: 'Veuillez entrer un lieu'),
                      CustTextFormField(
                          controller:
                              _expenseFormController.descriptionController,
                          prefixIcon: const Icon(Icons.description),
                          labelText: 'Entrez une description',
                          hintText: 'Exemple : déjeuner avec des amis',
                          errorText: 'Veuillez entrer une description'),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: OutlinedButton(
                            onPressed: () async {
                              if (validateAndSave()) {
                                await _expenseFormController.pushData();
                                globalFormKey1.currentState!.reset();
                              } else {
                                showDialog(
                                  context: Get.context!,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Remplir tous les champs"),
                                      content: const Text(
                                          'Veuillez remplir tous les champs souligés en rouge'),
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
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.all(20),
                              backgroundColor: const Color(0xFF363f93),
                            ),
                            child: const Text('Soumettre le formulaire',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey1.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

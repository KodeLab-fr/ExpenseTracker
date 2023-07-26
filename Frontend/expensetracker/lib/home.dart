import 'package:flutter/material.dart';
import 'package:bankingtool/Controllers/form_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> globalFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> globalFormKey2 = GlobalKey<FormState>();
  final FormController _expenseFormController = FormController();
  final FormController _creditFormController = FormController();
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
              title: const Text('Dépense'),
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 194, 71, 177),
              ),
              children: [
                Form(
                  key: globalFormKey1,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _expenseFormController.costController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.euro),
                          labelText: 'Entrez le montant',
                          hintText: 'Exemple : 10.00',
                        ),
                      ),
                      TextFormField(
                        controller: _expenseFormController.typeController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.category),
                          labelText: 'Entrez le type',
                          hintText: 'Exemple : déjeuner',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Crédit'),
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 75, 197, 140),
              ),
              children: [
                Form(
                  key: globalFormKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _creditFormController.descriptionController,
                      )
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
}

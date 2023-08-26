import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/register.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback toggleForm;
  const RegisterForm({super.key, required this.toggleForm});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hidePassword = true;
  final RegisterController _registerController = Get.put(RegisterController());
  GlobalKey<FormState> globalFormKeySU = GlobalKey<FormState>();

  ///Measures if the form is valid and saves it
  bool validateAndSave() {
    final form = globalFormKeySU.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  ///Resets the form to its initial state
  void reset() {
    globalFormKeySU.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Form(
      key: globalFormKeySU,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.1),
          SizedBox(
            height: height * 0.08,
            child: Text(
              'Expense Tracker App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93),
              ),
            ),
          ),
          Text(
            'Bienvenue !\nCréez votre utilisateur',
            style: TextStyle(
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93)),
          ),
          SizedBox(height: height * 0.08),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _registerController.nameController,
            autocorrect: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Entrez un nom',
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'Veuillez entrer un nom plus long';
              }
              return null;
            },
            maxLength: 25,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _registerController.emailController,
            autocorrect: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Entrez un email',
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'Veuillez entrer un email plus long';
              }
              return null;
            },
            maxLength: 25,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _registerController.passwordController,
            autocorrect: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Entrez un mot de passe',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: hidePassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre mdp';
              }
              return null;
            },
            obscureText: hidePassword,
          ),
          SizedBox(height: height * 0.03),
          Row(children: [
            const Text('Déjà un compte ? ',
                style: TextStyle(color: Colors.black38)),
            GestureDetector(
              onTap: () {
                widget.toggleForm();
              },
              child: const Text(
                'Se connecter',
                style: TextStyle(color: Color(0xFF363f93)),
              ),
            ),
          ]),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Envoyer',
                style: TextStyle(
                    fontSize: Platform.isMacOS ? 35 : 28,
                    color: const Color(0xFF363f93)),
              ),
              ElevatedButton(
                onPressed: () {
                  if (validateAndSave()) {
                    _registerController.signUp();
                    reset();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(Platform.isMacOS ? 20 : 15),
                  backgroundColor: const Color(0xFF363f93),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: Platform.isMacOS ? 45 : 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/presentation/controllers/sign_in.dart';

///All visual elements of the sign in form
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final SignInController _loginController = Get.put(SignInController());
  GlobalKey<FormState> globalFormKeySI = GlobalKey<FormState>();
  bool hidePassword = true;

  ///Switches the visibility of the password in the field
  void switchVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  ///Resets the form to its initial state
  void reset() {
    globalFormKeySI.currentState!.reset();
  }

  ///Measures if the form is valid and saves it
  bool validateAndSave() {
    final form = globalFormKeySI.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  ///Submits the form to the controller
  void submit() {
    if (validateAndSave()) {
      _loginController.login();
      reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: globalFormKeySI,
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
            "Bienvenue !\nAuthentifiez-vous",
            style: TextStyle(
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93)),
          ),
          SizedBox(height: height * 0.08),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _loginController.nameController,
            autocorrect: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Entrez votre nom',
            ),
            validator: (value) {
              if (value!.length < 3) {
                return 'Veuillez entrer un nom plus long';
              }
              return null;
            },
            maxLength: 25,
          ),
          SizedBox(height: height * 0.04),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _loginController.passwordController,
            autocorrect: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Entrez votre mot de passe',
              suffixIcon: IconButton(
                onPressed: () {
                  switchVisibility();
                },
                icon: hidePassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer un mdp';
              }
              return null;
            },
            obscureText: hidePassword,
          ),
          SizedBox(height: height * 0.07),
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
                  submit();
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

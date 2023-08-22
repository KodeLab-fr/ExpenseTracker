import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import '../controllers/sign_up.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool hidePassword = true;
  final SignUpController _signUpController = Get.put(SignUpController());

  GlobalKey<FormState> globalFormKeySU = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = globalFormKeySU.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void reset() {
    globalFormKeySU.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
            "Bienvenue !\nCréez votre utilisateur",
            style: TextStyle(
                fontSize: Platform.isMacOS ? 40 : 30,
                color: const Color(0xFF363f93)),
          ),
          SizedBox(height: height * 0.08),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _signUpController.nameController,
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
            controller: _signUpController.emailController,
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
            controller: _signUpController.passwordController,
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
                  if (validateAndSave()) {
                    _signUpController.signUp();
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

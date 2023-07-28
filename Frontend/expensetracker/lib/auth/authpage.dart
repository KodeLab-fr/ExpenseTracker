import 'dart:io';

import 'package:bankingtool/Controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Form(
            key: globalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  "Bienvenue !\nAuthentifiez-vous",
                  style: TextStyle(
                      fontSize: Platform.isMacOS ? 40 : 35,
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
                          fontSize: Platform.isMacOS ? 35 : 30,
                          color: const Color(0xFF363f93)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          _loginController.login();
                          globalFormKey.currentState!.reset();
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
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

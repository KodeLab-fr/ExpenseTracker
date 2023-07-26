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
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: globalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "Bienvenue",
                  style: TextStyle(fontSize: 40, color: Color(0xFF363f93)),
                ),
                const Text(
                  "Authentifiez-vous !",
                  style: TextStyle(fontSize: 40, color: Color(0xFF363f93)),
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
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
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
                    const Text(
                      'Envoyer',
                      style: TextStyle(fontSize: 35, color: Color(0xFF363f93)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          _loginController.login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: const Color(0xFF363f93),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 45,
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

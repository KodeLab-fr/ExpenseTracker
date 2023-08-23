import 'package:flutter/material.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSignUpFormVisible = true; 

  void toggleForm() {
    setState(() {
      isSignUpFormVisible = !isSignUpFormVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFffffff),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: isSignUpFormVisible
            ? SignUpForm(toggleForm: toggleForm)
            : SignInForm(toggleForm: toggleForm),
      ),
    );
  }
}

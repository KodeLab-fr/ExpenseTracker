import 'package:expensetracker/shared/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/login_form.dart';
import 'package:expensetracker/src/auth/presentation/pages/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRegisterFormVisible = true;

  void toggleForm() {
    setState(() {
      isRegisterFormVisible = !isRegisterFormVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return EnvironmentsBadge(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFffffff),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: isRegisterFormVisible
              ? RegisterForm(toggleForm: toggleForm)
              : LoginForm(toggleForm: toggleForm),
        ),
      ),
    );
  }
}

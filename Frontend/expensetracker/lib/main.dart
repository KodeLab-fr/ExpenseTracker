import 'package:expensetracker/shared/theme.dart';
import 'package:expensetracker/src/auth/presentation/pages/authpage.dart';
import 'package:expensetracker/src/auth/presentation/pages/introduction.dart';
import 'package:expensetracker/src/auth/presentation/pages/splashscreen.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

Future<void> main() async {
  dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      theme:customThemeData,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
          name: '/intro',
          page: () => const Introduction(),
          transition: Transition.fadeIn,
        ),
        GetPage(name: '/auth', page: () => const AuthPage()),
        GetPage(name: '/form', page: () => const FormPage()),
      ],
    );
  }
}

import 'package:bankingtool/Introduction/intro.dart';
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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          onSurface: Colors.black,
          surface: Colors.black,
          brightness: Brightness.light,
          background: Colors.white,
          primary: Color.fromARGB(255, 54, 63, 147),
          secondary: Color.fromARGB(255, 77, 89, 194),
          error: Colors.redAccent,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.black,
          onError: Colors.white,
        ),
      ),
    );
  }
}

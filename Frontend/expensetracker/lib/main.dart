import 'package:expensetracker/shared/routes/app_pages.dart';
import 'package:expensetracker/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      theme: theme,
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.NOTFOUND,
      getPages: AppPages.routes,
    ),
  );
}

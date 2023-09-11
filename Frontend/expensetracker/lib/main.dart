import 'package:expensetracker/core/i18n/translations.dart';
import 'package:expensetracker/core/routes/app_pages.dart';
import 'package:expensetracker/core/theme.dart';
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
      translations: ExpenseTrackerTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.NOTFOUND,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  );
}
 
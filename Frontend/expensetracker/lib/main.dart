import 'package:expensetracker/core/global.dart';
import 'package:expensetracker/core/i18n/translations.dart';
import 'package:expensetracker/core/routes/app_pages.dart';
import 'package:expensetracker/core/services/Locale-service.dart';
import 'package:expensetracker/core/services/theme-service.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
  await Global.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      theme: Themes().ligthTheme,
      darkTheme: Themes().darkTheme,
      themeMode: Get.find<ThemeService>().getTheme(),
      translations: ExpenseTrackerTranslations(),
      locale: Get.find<LocaleService>().getLocale(),
      fallbackLocale: const Locale('en'),
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.NOTFOUND,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  );
}

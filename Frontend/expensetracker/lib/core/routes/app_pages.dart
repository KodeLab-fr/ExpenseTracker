import 'package:expensetracker/src/auth/presentation/bindings/authentication-binding.dart';
import 'package:expensetracker/src/auth/presentation/bindings/otp-binding.dart';
import 'package:expensetracker/src/auth/presentation/bindings/intro-binding.dart';
import 'package:expensetracker/src/auth/presentation/bindings/network-binding.dart';
import 'package:expensetracker/src/auth/presentation/bindings/server_down-binding.dart';
import 'package:expensetracker/src/auth/presentation/bindings/splashscreen-binding.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/authentication-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/intro-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/network-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/otp-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/server_down-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/splashscreen-view.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/unknown-view.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:expensetracker/src/home/presentation/bindings/home-binding.dart';
import 'package:expensetracker/src/home/presentation/pages/views/home-view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;
  // ignore: non_constant_identifier_names
  static final NOTFOUND = GetPage(
    name: _Paths.NOTFOUND,
    page: () => const UnknownView(),
    transition: Transition.cupertino,
    curve: Curves.ease,
  );

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => const SplashScreenView(),
      binding: SplashBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
      transition: Transition.fadeIn,
      //curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthenticationView(),
      binding: AuthenticationBindings(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormPage(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.NOTFOUND,
      page: () => const UnknownView(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.NOCONNEXION,
      page: () => const NetworkView(),
      binding: NetworkBinding(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
    GetPage(
      name: _Paths.DOWN,
      page: () => const ServerDownView(),
      binding: ServerDownBinding(),
      transition: Transition.cupertino,
      curve: Curves.ease,
    ),
  ];
}

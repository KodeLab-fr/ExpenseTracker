import 'package:expensetracker/src/auth/presentation/bindings/auth.dart';
import 'package:expensetracker/src/auth/presentation/bindings/code.dart';
import 'package:expensetracker/src/auth/presentation/bindings/intro.dart';
import 'package:expensetracker/src/auth/presentation/bindings/network.dart';
import 'package:expensetracker/src/auth/presentation/bindings/splash.dart';
import 'package:expensetracker/src/auth/presentation/pages/authentication.dart';
import 'package:expensetracker/src/auth/presentation/pages/introduction.dart';
import 'package:expensetracker/src/auth/presentation/pages/network.dart';
import 'package:expensetracker/src/auth/presentation/pages/otp.dart';
import 'package:expensetracker/src/auth/presentation/pages/splashscreen.dart';
import 'package:expensetracker/src/auth/presentation/pages/unknown.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  // ignore: non_constant_identifier_names
  static final NOTFOUND = GetPage(
    name: _Paths.NOTFOUND,
    page: () => const UnknownPage(),
  );

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: _Paths.INTRO,
      page: () => const Introduction(),
      transition: Transition.fadeIn,
      binding: IntroControllerBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthPage(),
      binding: AuthControllersBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const Otp(),
      binding: CodeControllerBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormPage(),
    ),
    GetPage(
      name: _Paths.NOTFOUND,
      page: () => const UnknownPage(),
    ),
    GetPage(
      name: _Paths.NOCONNEXION,
      page: () => const NetworkView(),
      binding: NetworkControllerBinding(),
    ),
  ];
}

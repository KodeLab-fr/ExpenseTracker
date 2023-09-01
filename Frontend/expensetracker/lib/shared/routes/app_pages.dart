import 'package:expensetracker/src/auth/presentation/bindings/auth.dart';
import 'package:expensetracker/src/auth/presentation/bindings/code.dart';
import 'package:expensetracker/src/auth/presentation/bindings/intro.dart';
import 'package:expensetracker/src/auth/presentation/bindings/network.dart';
import 'package:expensetracker/src/auth/presentation/bindings/splash.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/authentication.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/introduction.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/network.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/otp.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/splashscreen.dart';
import 'package:expensetracker/src/auth/presentation/pages/views/unknown.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:expensetracker/src/home/presentation/bindings/home.dart';
import 'package:expensetracker/src/home/presentation/pages/views/home.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;
  // ignore: non_constant_identifier_names
  static final NOTFOUND = GetPage(
    name: _Paths.NOTFOUND,
    page: () => const UnknownView(),
  );

  static final routes = [
    GetPage(
        name: _Paths.ROOT,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      transition: Transition.fadeIn,
      binding: IntroControllerBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthControllersBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: CodeControllerBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormPage(),
    ),
    GetPage(
      name: _Paths.NOTFOUND,
      page: () => const UnknownView(),
    ),
    GetPage(
      name: _Paths.NOCONNEXION,
      page: () => const NetworkView(),
      binding: NetworkControllerBinding(),
    ),
  ];
}

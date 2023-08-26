part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const INTRO = _Paths.INTRO;
  static const AUTH = _Paths.AUTH;
  static const OTP = _Paths.OTP;
  static const FORM = _Paths.FORM;
  static const NOTFOUND = _Paths.NOTFOUND;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/';
  static const INTRO = '/intro';
  static const AUTH = '/auth';
  static const OTP = '/otp';
  static const FORM = '/form';
  static const NOTFOUND = '/notfound';
}

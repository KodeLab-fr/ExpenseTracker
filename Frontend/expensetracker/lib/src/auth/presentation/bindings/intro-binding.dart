import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageController>(() => PageController());
  }
}

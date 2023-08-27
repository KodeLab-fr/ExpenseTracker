import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageController>(() => PageController());
  }
}

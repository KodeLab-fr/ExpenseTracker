import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('home-title'.tr,
            style: const TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: const Color(0xFF363f93),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        child: const Center(child: Text('HomeScreenWorking')),
      ),
    );
  }
}

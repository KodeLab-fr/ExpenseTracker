import 'package:expensetracker/src/home/presentation/controllers/home-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home page is working (debug)'));
  }
}

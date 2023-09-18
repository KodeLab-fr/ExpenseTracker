import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/src/home/presentation/controllers/home-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This view contains the home of the app
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Adresses.HOME_VIEW_TITLE.tr));
  }
}

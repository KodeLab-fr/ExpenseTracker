import 'package:expensetracker/core/navigation/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends GetView {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SideDrawer(),
    );
  }
}

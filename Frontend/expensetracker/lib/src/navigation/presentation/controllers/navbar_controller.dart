import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
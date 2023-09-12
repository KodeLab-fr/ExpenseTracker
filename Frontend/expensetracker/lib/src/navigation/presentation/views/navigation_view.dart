import 'package:expensetracker/src/calendar/presentation/pages/views/calendar-view.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/navbar_controller.dart';
import 'package:expensetracker/src/navigation/presentation/views/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends GetView<NavbarController> {
  const NavigationView({super.key});

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('home-title'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 25)),
            backgroundColor: const Color(0xFF363f93),
          ),
          drawer: const SideDrawer(),
          body: Obx(() {
            return IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                Center(
                  child: Text('Home'),
                ),
                CalendarView(),
                FormPage(),
                Center(
                  child: Text('Settings'),
                ),
              ],
            );
          }),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
                currentIndex: controller.tabIndex.value,
                selectedItemColor: const Color(0xFF363f93),
                unselectedItemColor: Colors.black38,
                onTap: controller.changeTabIndex,
                items: [
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.home, label: 'Home'),
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.calendar, label: 'Calendar'),
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.rectangle_paperclip, label: 'Forms'),
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.settings, label: 'Settings'),
                ]);
          }),
        );
      },
    );
  }
}

import 'package:expensetracker/core/navigation/controllers/navbar_controller.dart';
import 'package:expensetracker/core/navigation/view/widgets/drawer.dart';
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
                Center(
                  child: Text('About'),
                ),
                Center(
                  child: Text('Contact'),
                ),
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
                      icon: Icons.home_outlined, label: 'Home'),
                  _bottomNavigationBarItem(
                      icon: Icons.info_outline, label: 'About'),
                  _bottomNavigationBarItem(
                      icon: Icons.contact_page_outlined, label: 'Contact'),
                  _bottomNavigationBarItem(
                      icon: Icons.settings_outlined, label: 'Settings'),
                ]);
          }),
        );
      },
    );
  }
}

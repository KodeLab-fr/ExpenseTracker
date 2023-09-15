import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/src/calendar/presentation/pages/views/calendar-view.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:expensetracker/src/home/presentation/pages/views/home-view.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/navbar_controller.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/side_drawer-controller.dart';
import 'package:expensetracker/src/navigation/presentation/views/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends GetView<NavbarController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<NavbarController>(
      builder: (context) {
        return Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GetBuilder<SideDrawerController>(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 35,
                    color: Palette.WHITE,
                  ),
                  onPressed: controller.scaffoldKey.currentState!.openDrawer,
                );
              },
            ),
            title: Text(
              'home-title'.tr,
              style: theme.textTheme.titleMedium,
            ),
            backgroundColor: Palette.PRIMARY,
          ),
          drawer: const SideDrawer(),
          body: Obx(() {
            return IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                HomeView(),
                ScheduleView(),
                FormPage(),
                Center(
                  child: Text('Settings page is working (debug)'),
                ),
              ],
            );
          }),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
                currentIndex: controller.tabIndex.value,
                selectedItemColor:
                    theme.bottomNavigationBarTheme.selectedItemColor,
                unselectedItemColor:
                    theme.bottomNavigationBarTheme.unselectedItemColor,
                onTap: controller.changeTabIndex,
                items: [
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.home,
                    label: 'navbar-home'.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.calendar,
                    label: 'navbar-calendar'.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.rectangle_paperclip,
                    label: 'navbar-forms'.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.settings,
                    label: 'navbar-settings'.tr,
                  ),
                ]);
          }),
        );
      },
    );
  }
}

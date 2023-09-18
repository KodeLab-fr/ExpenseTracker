import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/src/calendar/presentation/pages/views/calendar-view.dart';
import 'package:expensetracker/src/forms/presentation/pages/formpage.dart';
import 'package:expensetracker/src/home/presentation/pages/views/home-view.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/navbar_controller.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/side_drawer-controller.dart';
import 'package:expensetracker/src/navigation/presentation/views/widgets/drawer.dart';
import 'package:expensetracker/src/settings/presentation/view/settings-view.dart';
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
              Adresses.APP_NAME.tr,
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
                SettingsView(),
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
                    label: Adresses.NAVIGATION_VIEW_HOME.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.calendar,
                    label: Adresses.NAVIGATION_VIEW_CALENDAR.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.rectangle_paperclip,
                    label: Adresses.NAVIGATION_VIEW_FORMS.tr,
                  ),
                  controller.bottomNavigationBarItem(
                    icon: CupertinoIcons.settings,
                    label: Adresses.NAVIGATION_VIEW_SETTINGS.tr,
                  ),
                ]);
          }),
        );
      },
    );
  }
}

import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/side_drawer-controller.dart';

class SideDrawer extends GetView<SideDrawerController> {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            //* FIXME : change with the actual info
            accountName: Text('Roman Shauwn'),
            accountEmail: Text('adresse@gmail.com'),
            // *
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/img/defaultPP.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images-assets.nasa.gov/image/iss069e084550/iss069e084550~medium.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.home),
            title: Text(
              Adresses.DRAWER_VIEW_HOME.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.info),
            title: Text(
              Adresses.DRAWER_VIEW_ABOUT.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.mail),
            title: Text(
              Adresses.DRAWER_VIEW_CONTACT.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(CupertinoIcons.globe),
            title: Text(
              Adresses.DRAWER_VIEW_LANG.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: controller.changeLangage,
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.settings),
            title: Text(
              Adresses.DRAWER_VIEW_SETTINGS.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: controller.changeTheme,
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.square_arrow_right),
            title: Text(
              Adresses.DRAWER_VIEW_LOGOUT.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: controller.logout,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/core/navigation/controllers/side_drawer-controller.dart';

class SideDrawer extends GetView<SideDrawerController> {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            //TODO : change with the actual info
            accountName: Text('Roman Shauwn'),
            accountEmail: Text('adresse@gmail.com'),
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
            leading: const Icon(Icons.home),
            title: Text('drawer-home'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text('drawer-about'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: Text('drawer-contact'.tr),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('drawer-lang'.tr),
            onTap: () {
              controller.changeLangage();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('drawer-settings'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('drawer-logout'.tr),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}

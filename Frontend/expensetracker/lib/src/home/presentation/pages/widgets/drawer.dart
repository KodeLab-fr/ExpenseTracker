import 'package:expensetracker/src/home/presentation/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HeadDrawer extends GetView<HomeController> {
  const HeadDrawer({super.key});

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
            title: Text('home-home'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text('home-about'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: Text('home-contact'.tr),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('home-settings'.tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('home-logout'.tr),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}

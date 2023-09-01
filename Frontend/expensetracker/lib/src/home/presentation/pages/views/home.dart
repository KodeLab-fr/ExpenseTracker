import 'package:expensetracker/src/home/presentation/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: const Color(0xFF363f93),
      ),
      drawer: const HeadDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        child: const Center(child: Text('HomeScreenWorking')),
      ),
    );
  }
}

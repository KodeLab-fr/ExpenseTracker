import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This view contains the settings of the app
class SettingsView extends GetView {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Adresses.SETTINGS_VIEW_TITLE.tr));
  }
}

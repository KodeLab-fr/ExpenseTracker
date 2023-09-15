import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleView extends GetView {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_control/model/weight/controllerDashboardInfo.dart';
import 'package:weight_control/screens/first-meeting.dart';
import 'package:weight_control/screens/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ControllerDashboardInfo controllerDashboardInfo = Get.put(ControllerDashboardInfo());

return Obx(() => controllerDashboardInfo.flagFirstMeeting.value ? FirstMeeting() : HomePage());
  }
}
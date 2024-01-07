import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/dashboard/screen/widget/date_picker_form.dart';
import 'package:upway_in/features/dashboard/controller/dashboard_controller.dart';
import 'package:upway_in/common/widget/user_quantity.dart';
import 'package:upway_in/features/login/screen/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await controller.getAllUserList();
    await controller.getTodayUserList();
    await controller.getYesterdayUserList();
  }

  @override
  Widget build(BuildContext context) {
    final yesterdayUserList =
        DashboardController.instance.yesterdayUserJsonList;
    final todayUserList = DashboardController.instance.todayUserJsonList;
    final allUserList = DashboardController.instance.userJsonList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xFF83A2FF),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(Icons.lock)),
          const Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DatePickerForm(),
            const SizedBox(height: 20),
            UserQuantity(
                dayUserList: allUserList, subTitle: "Total number of Users"),
            const SizedBox(height: 20),
            UserQuantity(dayUserList: todayUserList, subTitle: "Today so Far"),
            const SizedBox(height: 20),
            UserQuantity(
                dayUserList: yesterdayUserList, subTitle: "Yesterday's Users"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

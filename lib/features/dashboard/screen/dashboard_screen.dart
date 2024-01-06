import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/dashboard/controller/dashboard_controller.dart';
import 'package:upway_in/features/dashboard/screen/widget/fetch_user_list.dart';
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
  }

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              controller: controller.selectedDate,
              decoration: const InputDecoration(
                labelText: "Date",
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF83A2FF),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF83A2FF),
                  ),
                ),
              ),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF83A2FF)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF83A2FF)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Obx(
                          () {
                            final userJsonList =
                                DashboardController.instance.userJsonList;
                            if (DashboardController.instance.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (userJsonList.isEmpty) {
                              return const Text('0');
                            } else {
                              return Text(
                                userJsonList.length.toString(),
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }

                            // return UserListTable(userJsonList: userJsonList);
                          },
                        ),
                      ),
                    ),
                    const Text(
                      "Total Number Of User",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF83A2FF)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF83A2FF)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Obx(
                          () {
                            final userJsonList =
                                DashboardController.instance.userJsonList;
                            if (DashboardController.instance.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (userJsonList.isEmpty) {
                              return const Text('0');
                            } else {
                              return Text(
                                userJsonList.length.toString(),
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }

                            // return UserListTable(userJsonList: userJsonList);
                          },
                        ),
                      ),
                    ),
                    const Text(
                      "Total Number Of User",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FetchUserList(controller: controller),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        controller.selectedDate.text = _picked.toString().split(" ")[0];
        DashboardController.instance.getDataFromSelectedDate();
      });
    }
  }
}

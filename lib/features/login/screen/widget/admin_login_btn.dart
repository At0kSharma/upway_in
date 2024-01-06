import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/dashboard/screen/dashboard_screen.dart';

class AdminLoginBtn extends StatelessWidget {
  const AdminLoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16, // Adjust the distance from the bottom as needed
      right: 16, // Adjust the distance from the right as needed
      child: FloatingActionButton(
        onPressed: () {
          Get.offAll(() => const DashboardScreen());
        },
        backgroundColor: const Color(0xFF83A2FF),
        child: const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
    );
  }
}

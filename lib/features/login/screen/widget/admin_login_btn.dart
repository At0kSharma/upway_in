import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/admin/screen/admin_login_screen.dart';
import 'package:upway_in/features/dashboard/screen/dashboard_screen.dart';

class AdminLoginBtn extends StatelessWidget {
  const AdminLoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 135, right: 135),
      child: ElevatedButton(
        onPressed: () {
          Get.offAll(() => const AdminLogin());
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: const Size(100, 40),
          foregroundColor: const Color(0xFF83A2FF),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        child: const Text("Dashboard"),
      ),
    );
  }
}

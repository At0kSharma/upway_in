import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/admin/controller/admin_controller.dart';
import 'package:upway_in/features/dashboard/screen/dashboard_screen.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get instance => Get.find();
  final password = TextEditingController();
  final email = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final adminRepo = Get.put(AdminController());
  authenticateAdminUser(String email, String password) async {
    await AdminController.instance.verifyPassword(email, password)
        ? Get.offAll(() => const DashboardScreen())
        : Get.snackbar("Error", "You are not Authorized");
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/authentication_controller.dart';
import 'package:upway_in/features/authentication/user/controller/user_controller.dart';
import 'package:upway_in/features/authentication/user/model/user_model.dart';
import 'package:upway_in/features/verify/screen/verify_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final name = TextEditingController();

  final userRepo = Get.put(UserController());

  Future<void> createUser(UserModel user) async {
    phoneAuthentication(user.phoneNumber);
    await userRepo.createUser(user);
    Get.to(() => const VerifyScreen());
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationController.instance.phoneAuthentication(phoneNumber);
  }
}

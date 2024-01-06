import 'package:get/get.dart';
import 'package:upway_in/features/admin/controller/admin_login_controller.dart';
import 'package:upway_in/features/authentication/authentication_controller.dart';
import 'package:upway_in/features/authentication/user/controller/user_controller.dart';
import 'package:upway_in/features/home/controller/update_otp_status.dart';
import 'package:upway_in/features/login/controller/login_controller.dart';
import 'package:upway_in/features/verify/controller/verify_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<UpdateOTPController>(UpdateOTPController(), permanent: true);
    Get.put<AdminLoginController>(AdminLoginController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<VerifyController>(VerifyController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
  }
}

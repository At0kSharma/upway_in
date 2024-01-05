import 'package:get/get.dart';
import 'package:upway_in/features/authentication/authentication_controller.dart';
import 'package:upway_in/features/home/screen/home_screen.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationController.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }
}

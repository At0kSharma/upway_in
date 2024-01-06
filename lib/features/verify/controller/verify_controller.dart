import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/authentication_controller.dart';
import 'package:upway_in/features/home/controller/update_otp_status.dart';
import 'package:upway_in/features/home/screen/home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationController.instance.verifyOTP(otp);
    if (isVerified) {
      final currentUser = await _getCurrentUserId();
      await UpdateOTPController.instance
          .updateOTPStatus(currentUser.toString());
      Get.offAll(const HomeScreen());
    } else {
      Get.back();
    }
    // isVerified ? Get.to(const HomeScreen()) : Get.back();
  }
}

Future<String?> _getCurrentUserId() async {
  User? user = _auth.currentUser;
  return user?.phoneNumber;
}

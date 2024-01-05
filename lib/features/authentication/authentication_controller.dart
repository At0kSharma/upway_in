import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/home/screen/home_screen.dart';
import 'package:upway_in/features/login/screen/login_screen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream((_auth.userChanges()));
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    await Future.delayed(const Duration(seconds: 2));
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resentToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The Provided Phone number is not valid.");
        } else {
          Get.snackbar("Error", "Something went wrong. Try Again");
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otp));

      // Check if credentials.user is null
      if (credentials.user != null) {
        return true; // Successfully verified OTP
      } else {
        // Handle the case where credentials.user is null
        Get.snackbar("Error", "Failed to verify OTP. User is null.");
        return false;
      }
    } catch (e) {
      // Handle any other exceptions that might occur during OTP verification
      Get.snackbar("Error", "Failed to verify OTP. $e");
      return false;
    }
  }
}

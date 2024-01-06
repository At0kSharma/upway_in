import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/dashboard/screen/dashboard_screen.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get instance => Get.find();
  final password = TextEditingController();
  final email = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign up with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(const DashboardScreen());
    } catch (e) {
      // Handle error
      print("Error creating user: $e");
    }
  }

// Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Get.to(const DashboardScreen());
    } catch (e) {
      // Handle error and show a SnackBar
      if (e is FirebaseAuthException) {
        String errorMessage = 'An error occurred. Please try again.';
        if (e.code == 'invalid-email' || e.code == 'invalid-credential') {
          errorMessage = 'Invalid email or password';
        }
        Get.snackbar("Error", errorMessage);
      } else {
        // Handle other types of exceptions
        print("Unexpected error: $e");
      }
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

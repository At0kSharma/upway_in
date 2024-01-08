import 'package:flutter/material.dart';
import 'package:upway_in/features/verify/screen/widget/otp_verify_form.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String otp;
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: const [
            OtpVerifyForm(),
          ],
        ),
      ),
    );
  }
}

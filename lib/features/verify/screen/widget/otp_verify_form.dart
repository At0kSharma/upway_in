import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:upway_in/common/widget/form_label.dart';
import 'package:upway_in/features/verify/controller/verify_controller.dart';
import 'package:upway_in/helpers/helper_functions.dart';

class OtpVerifyForm extends StatelessWidget {
  const OtpVerifyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var otp;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FormLabel(label: "Enter Your  OTP Here"),
          const SizedBox(height: 10),
          OtpTextField(
            numberOfFields: 6,
            fieldWidth: HelperFunctions.screenWidth() * 0.125,
            enabledBorderColor: const Color.fromARGB(115, 155, 154, 154),
            focusedBorderColor: const Color(0xFF849AD4),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String code) {
              otp = code;
              VerifyController.instance.verifyOTP(otp);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              VerifyController.instance.verifyOTP(otp);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(340, 60),
              backgroundColor: const Color(0xFF849AD4),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            child: const Text("SUBMIT"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

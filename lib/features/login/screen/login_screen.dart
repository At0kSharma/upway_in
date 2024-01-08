import 'package:flutter/material.dart';
import 'package:upway_in/features/login/screen/widget/admin_login_btn.dart';
import 'package:upway_in/features/login/screen/widget/login_form.dart';
import 'package:upway_in/features/login/screen/widget/offer_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const OfferText(),
              LoginForm(),
            ],
          ),
          const AdminLoginBtn(),
        ],
      ),
    );
  }
}

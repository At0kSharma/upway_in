import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upway_in/utils/constant/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage(ImageString.splashImage),
      )),
    );
  }
}

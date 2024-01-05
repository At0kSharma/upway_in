import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upway_in/app.dart';
import 'package:upway_in/bindings/global_binding.dart';
import 'package:upway_in/firebase_options.dart';
// import 'package:get/get.dart';

// import 'controllers/authentication_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((value) => Get.put(AuthenticationController()));
  GlobalBindings().dependencies();
  runApp(const App());
}

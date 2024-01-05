import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/user/model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        // .whenComplete(
        //   () => Get.snackbar(
        //     "Success",
        //     "Your account has been created",
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.green.withOpacity(0.1),
        //     colorText: Colors.green,
        //   ),
        // )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong, Try again',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green.withOpacity(0.1),
      //   colorText: Colors.red,
      // );
    });
  }
}

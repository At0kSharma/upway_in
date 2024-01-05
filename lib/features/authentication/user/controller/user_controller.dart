import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/user/model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<bool> doesUserExist(String phoneNumber) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where('phone', isEqualTo: phoneNumber)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())

        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {});
  }
}

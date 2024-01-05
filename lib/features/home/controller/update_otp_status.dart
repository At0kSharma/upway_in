import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/authentication/user/controller/user_controller.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final userRepo = Get.put(UserController());
final _db = FirebaseFirestore.instance;

class UpdateOTPController extends GetxController {
  static UpdateOTPController get instance => Get.find();

  Future<void> updateOTPStatus(String currentUser) async {
    if (await userRepo.doesUserExist(currentUser)) {
      await _db
          .collection("Users")
          .where('phone', isEqualTo: currentUser)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.update({'isVerified': true});
        });
      });
    }
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  // Hash the password using SHA-256
  String hashPassword(String password) {
    var bytes = utf8.encode(password); // Encode the password as bytes
    var digest = sha256.convert(bytes); // Compute the SHA-256 hash
    return digest.toString(); // Convert the hash to a string
  }

// Create or update user with hashed password in Firestore
  Future<void> createOrUpdateUser(String email, String hashedPassword) async {
    final CollectionReference adminsCollection =
        FirebaseFirestore.instance.collection('admins');

    // Check if the admin already exists by querying the collection with the email
    QuerySnapshot querySnapshot =
        await adminsCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // If admin already exists, update the existing admin with the new hashed password
      await adminsCollection
          .doc(querySnapshot.docs.first.id)
          .update({'authentication': hashedPassword});
    } else {
      // If admin doesn't exist, create a new admin with the email and hashed password
      await adminsCollection.add({
        'email': email,
        'authentication': hashedPassword,
        'registrationDate': FieldValue.serverTimestamp(),
        'isAdmin': false, // You can customize this based on your logic
      });
    }
  }

  // Verify if entered password matches the hashed password in Firestore
  Future<bool> verifyPassword(String email, String enteredPassword) async {
    final CollectionReference adminsCollection =
        FirebaseFirestore.instance.collection('admins');

    // Retrieve the document of the admin based on the email
    QuerySnapshot querySnapshot =
        await adminsCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Get the stored hashed password from the Firestore document
      var storedHashedPassword =
          querySnapshot.docs.first['authentication'].toString();

      // Hash the entered password for comparison
      var enteredHash = hashPassword(enteredPassword);

      // Compare the entered password hash with the stored hash
      return enteredHash == storedHashedPassword;
    }

    // Return false if the admin with the specified email does not exist
    return false;
  }
}

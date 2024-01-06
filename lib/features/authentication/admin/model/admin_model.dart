import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String? id;
  final String email;
  final String auth;
  final Timestamp registrationDate;
  final bool isAdmin;

  const AdminModel({
    this.id,
    required this.email,
    required this.auth,
    required this.registrationDate,
    required this.isAdmin,
  });
  toJson() {
    return {
      "email": email,
      "authentication": auth,
      "registrationDate": registrationDate,
      "isAdmin": isAdmin,
    };
  }
}

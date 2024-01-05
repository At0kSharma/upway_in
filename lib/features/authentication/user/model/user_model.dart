import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String userName;
  final String phoneNumber;
  final Timestamp registrationDate;

  const UserModel({
    this.id,
    required this.userName,
    required this.phoneNumber,
    required this.registrationDate,
  });
  toJson() {
    return {
      "name": userName,
      "phone": phoneNumber,
      "registrationDate": registrationDate,
    };
  }
}

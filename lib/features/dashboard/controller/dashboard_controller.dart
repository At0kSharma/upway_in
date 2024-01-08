// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  final selectedDate = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> userJsonList =
      <Map<String, dynamic>>[].obs;
  int get numberOfUsers => userJsonList.length;
  final RxList<Map<String, dynamic>> todayUserJsonList =
      <Map<String, dynamic>>[].obs;
  int get numberOfUsersToday => todayUserJsonList.length;
  final RxList<Map<String, dynamic>> yesterdayUserJsonList =
      <Map<String, dynamic>>[].obs;
  int get numberOfUsersYesterday => yesterdayUserJsonList.length;

  Future<void> getAllUserList() async {
    try {
      isLoading(true);
      // Query Firestore to get documents where registrationDate is within the selected date
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('isVerified', isEqualTo: true)
          .get();

      // Clear the previous data
      userJsonList.clear();

      // Iterate through the documents and handle the data as needed
      // Iterate through the documents and add them to the userJsonList
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        userJsonList.add(data);
        // print(userJsonList);
      });
      isLoading(false);
    } catch (error) {
      // Handle any errors that might occur
      print('Error fetching data: $error');
    }
  }

  // Fetch today's users
  Future<void> getTodayUserList() async {
    final DateTime now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    print(startOfDay);

    try {
      isLoading(true);
      // Query Firestore to get documents where registrationDate is within the selected date
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('isVerified', isEqualTo: true)
          .where('registrationDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('registrationDate', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      // Clear the previous data
      todayUserJsonList.clear();

      // Iterate through the documents and handle the data as needed
      // Iterate through the documents and add them to the userJsonList
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        todayUserJsonList.add(data);
        // print(userJsonList);
      });
      isLoading(false);
    } catch (error) {
      // Handle any errors that might occur
      print('Error fetching data: $error');
    }
  }

  // Fetch yesterday's users
  Future<void> getYesterdayUserList() async {
    final DateTime now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day - 1);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    try {
      isLoading(true);
      // Query Firestore to get documents where registrationDate is within the selected date
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('isVerified', isEqualTo: true)
          .where('registrationDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('registrationDate', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      // Clear the previous data
      yesterdayUserJsonList.clear();

      // Iterate through the documents and handle the data as needed
      // Iterate through the documents and add them to the userJsonList
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        yesterdayUserJsonList.add(data);
        // print(userJsonList);
      });
      isLoading(false);
    } catch (error) {
      // Handle any errors that might occur
      print('Error fetching data: $error');
    }
  }
}

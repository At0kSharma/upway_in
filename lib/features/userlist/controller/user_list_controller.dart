// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  static UserListController get instance => Get.find();
  final selectedDate = TextEditingController();

  final RxList<Map<String, dynamic>> userJsonList =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  int get numberOfUsers => userJsonList.length;

  // Fetch data from Firestore based on selected date
  Future<void> getDataFromSelectedDate() async {
    final selectedDateString = selectedDate.text.trim();

    // Convert the selected date string to a DateTime
    final selectedDateTime = DateTime.parse(selectedDateString);

    // Get the start and end of the selected date
    final DateTime startOfDay = DateTime(
        selectedDateTime.year, selectedDateTime.month, selectedDateTime.day);
    final DateTime endOfDay = startOfDay.add(const Duration(days: 1));

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
}

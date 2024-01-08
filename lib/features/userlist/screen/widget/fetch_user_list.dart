import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:upway_in/features/userlist/controller/user_list_controller.dart';
import 'package:upway_in/features/userlist/screen/widget/user_list_table.dart';

class FetchUserList extends StatelessWidget {
  const FetchUserList({
    super.key,
    required this.controller,
  });

  final UserListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final userJsonList = UserListController.instance.userJsonList;

        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (userJsonList.isEmpty) {
          return const Text('No users found.');
        }
        // return const Text("test");
        return UserListTable(userJsonList: userJsonList);
      },
    );
  }
}

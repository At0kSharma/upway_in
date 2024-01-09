import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:upway_in/features/userlist/controller/user_list_controller.dart';

class FetchUserList extends StatelessWidget {
  const FetchUserList({
    super.key,
    required this.filteredUserOnSelectedDateJsonList,
  });

  final List<Map<String, dynamic>> filteredUserOnSelectedDateJsonList;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final userJsonList = filteredUserOnSelectedDateJsonList;

        if (UserListController.instance.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (userJsonList.isEmpty) {
          return const Text('No users found.');
        }
        // return const Text("test");
        // return UserListTable(userJsonList: userJsonList);
        return DataTable(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          // border: TableBorder.all(width: 1),
          dividerThickness: 0,
          border: const TableBorder(
            verticalInside: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),

          headingRowColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFF83A2FF)),

          columns: const [
            DataColumn(
                label: Text(
              'Name',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Phone',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
          ],
          rows: userJsonList
              .map(
                (userJson) => DataRow(
                  cells: [
                    DataCell(
                      SizedBox(
                        width: 115,
                        child: Text(
                          userJson['name'],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 120,
                        child: Text(
                          userJson['phone'],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}

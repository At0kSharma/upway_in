import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserListTable extends StatelessWidget {
  const UserListTable({
    super.key,
    required this.userJsonList,
  });

  final RxList<Map<String, dynamic>> userJsonList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
      columnSpacing: 80.0,
      columns: const [
        DataColumn(
            label: Text(
          'Name',
          style: TextStyle(fontSize: 16),
        )),
        DataColumn(
            label: Text(
          'Phone',
          style: TextStyle(fontSize: 16),
        )),
      ],
      rows: userJsonList
          .map(
            (userJson) => DataRow(
              cells: [
                DataCell(Text(
                  userJson['name'],
                  style: const TextStyle(fontSize: 15),
                )),
                DataCell(Text(
                  userJson['phone'],
                  style: const TextStyle(fontSize: 15),
                )),
              ],
            ),
          )
          .toList(),
    );
  }
}

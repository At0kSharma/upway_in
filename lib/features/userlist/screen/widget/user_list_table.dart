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
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      // border: TableBorder.all(width: 1),
      dividerThickness: 0,
      border: const TableBorder(
        verticalInside: BorderSide(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),

      headingRowColor:
          MaterialStateColor.resolveWith((states) => const Color(0xFF83A2FF)),
      columnSpacing: 80.0,
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

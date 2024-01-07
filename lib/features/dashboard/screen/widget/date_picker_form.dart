import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/features/userlist/controller/user_list_controller.dart';
import 'package:upway_in/features/userlist/screen/user_list_screen.dart';

class DatePickerForm extends StatelessWidget {
  DatePickerForm({super.key});
  final controller = Get.put(UserListController());

  // bool isdateSelected = false;

  @override
  Widget build(BuildContext context) {
    // bool isDateSelected = false;
    return TextFormField(
      controller: controller.selectedDate,
      decoration: InputDecoration(
        labelText: "Date",
        filled: true,
        prefixIcon: const Icon(Icons.calendar_today),
        suffixIcon: IconButton(
            onPressed: () {
              if (controller.selectedDate.text != "") {
                Get.to(() => const UserListScreen());
              }
            },
            icon: const Icon(Icons.search)),
        fillColor: Colors.transparent,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF83A2FF),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF83A2FF),
          ),
        ),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      // print(controller.selectedDate.text);
      controller.selectedDate.text = _picked.toString().split(" ")[0];
      // isDateSelected = true;
      // UserListController.instance.getDataFromSelectedDate();
    }
  }
}

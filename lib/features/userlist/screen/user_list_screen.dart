import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/common/widget/user_quantity.dart';
import 'package:upway_in/features/login/screen/login_screen.dart';
import 'package:upway_in/features/userlist/controller/user_list_controller.dart';
import 'package:upway_in/features/userlist/screen/widget/fetch_user_list.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({
    super.key,
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final controller = Get.put(UserListController());

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await controller.getDataFromSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    final userListOnSelectedDate = UserListController.instance.userJsonList;
    final currentDate = controller.selectedDate.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        backgroundColor: const Color(0xFF83A2FF),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(Icons.lock)),
          const Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: AlignmentDirectional.center,
              child: Text(
                currentDate,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: UserQuantity(
                  dayUserList: userListOnSelectedDate,
                  subTitle: "Total number of Users"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(5),
              height: 50,
              width: 300,
              // decoration: BoxDecoration(
              //   border: Border.all(color: const Color(0xFF83A2FF)),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text("PDF"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF83A2FF),
                      foregroundColor: Colors.white,
                    ),
                  ),
                  // const SizedBox(width: 10),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.download),
                  //   label: const Text("CSV"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color(0xFF83A2FF),
                  //     foregroundColor: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: FetchUserList(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}

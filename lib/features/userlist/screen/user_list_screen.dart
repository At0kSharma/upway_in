import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upway_in/common/widget/user_quantity.dart';
import 'package:upway_in/features/login/screen/login_screen.dart';
import 'package:upway_in/features/userlist/controller/pdf_controller.dart';
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
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredUserJsonList = [];

  final userListOnSelectedDate = UserListController.instance.userJsonList;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await controller.getDataFromSelectedDate();
  }

  void _searchUsers() {
    final String searchQuery = searchController.text.toLowerCase();

    if (searchQuery.isNotEmpty) {
      // Filter the userJsonList based on the search query
      filteredUserJsonList = UserListController.instance.userJsonList
          .where((user) =>
              user['name'].toLowerCase().contains(searchQuery) ||
              user['phone'].toLowerCase().contains(searchQuery))
          .toList();
    } else {
      // If the search query is empty, reset the filtered list
      filteredUserJsonList.clear();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filteredUserOnSelectedDateJsonList = filteredUserJsonList.isEmpty
        ? UserListController.instance.userJsonList
        : filteredUserJsonList;

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
              padding: const EdgeInsets.all(0),
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF83A2FF)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        _searchUsers();
                      },
                      decoration: InputDecoration(
                        labelText: 'Search...',
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      PdfController.instance
                          .generatePdfFile(userListOnSelectedDate);
                    },
                    icon: const Icon(Icons.picture_as_pdf),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(30),
              // child: FetchUserList(controller: controller),
              child: FetchUserList(
                  filteredUserOnSelectedDateJsonList:
                      filteredUserOnSelectedDateJsonList),
            ),
          ],
        ),
      ),
    );
  }
}

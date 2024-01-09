import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:upway_in/features/dashboard/controller/dashboard_controller.dart';

class UserQuantity extends StatelessWidget {
  const UserQuantity({
    super.key,
    required this.dayUserList,
    required this.subTitle,
  });

  final RxList<Map<String, dynamic>> dayUserList;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 330,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF83A2FF)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF83A2FF)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Obx(
                  () {
                    final userJsonList = dayUserList;
                    if (DashboardController.instance.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (userJsonList.isEmpty) {
                      return const Text(
                        '0',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    } else {
                      return Text(
                        userJsonList.length.toString(),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

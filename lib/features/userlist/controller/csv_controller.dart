import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

class CsvController extends GetxController {
  static CsvController get instance => Get.find();

  Future<void> generateCsvFile(List<Map<String, dynamic>> userlist) async {
    final csvList = <List<String>>[];

    for (var user in userlist) {
      final List<String> csvRow = [
        user['name'].toString(),
        user['phone'].toString(),
        user['registrationDate'] != null
            ? _formatDate(user['registrationDate'].toDate())
            : '',
      ];

      csvList.add(csvRow);
    }

    final Directory? externalDir = await getExternalStorageDirectory();

    if (externalDir != null) {
      int count = 1;
      final String formattedDate =
          _formatDate(userlist[0]['registrationDate'].toDate());
      String fileName = '$formattedDate-UpWayUsersList.csv';
      String path = '/storage/emulated/0/Download/$fileName';

      while (await File(path).exists()) {
        count++;
        fileName = '$formattedDate-UpWayUsersList_$count.csv';
        path = '/storage/emulated/0/Download/$fileName';
      }

      final File file = File(path);
      file.writeAsString(const ListToCsvConverter().convert(csvList));

      // Provide a message to the user that the download is complete
      Get.snackbar('Download Complete',
          'CSV file saved successfully to  Download folder');
    } else {
      // Handle the case when external storage directory is null
      Get.snackbar('Error', 'Failed to get external storage directory');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}

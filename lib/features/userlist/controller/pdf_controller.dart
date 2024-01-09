import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PdfController extends GetxController {
  static PdfController get instance => Get.find();

  Future<void> generatePdfFile(userlist) async {
    final pdf = pw.Document();

    final List<List<dynamic>> data = [];

    for (var user in userlist) {
      final List<dynamic> rowData = [
        user['name'].toString(),
        user['phone'].toString(),
        // user['isVerified'].toString(),
        user['registrationDate'] != null
            ? user['registrationDate'].toDate().toString()
            : '',
      ];

      data.add(rowData);
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            // Header
            pw.Text(
              'UpWay Users List',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            // Date
            pw.Text(
              'Date: ${userlist.isNotEmpty && userlist[0]['registrationDate'] != null ? _formatDate(userlist[0]['registrationDate'].toDate()) : ''}',
              style: pw.TextStyle(
                fontSize: 14,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
            pw.SizedBox(height: 20),
            // Table
            pw.TableHelper.fromTextArray(
              headers: const ['Name', 'Phone', 'Registration Date'],
              data: data,
            ),
          ];
        },
      ),
    ); // Page

    // Get the external storage directory
    // final Directory? externalDir = await getExternalStorageDirectory();
    final Directory? externalDir = await getExternalStorageDirectory();

    if (externalDir != null) {
      // Save the PDF file to the external directory
      // final String path = '${externalDir.path}/UpWayUsersList.pdf';
      // final File file = File(path);
      // const String path = '/storage/emulated/0/Download/UpWayUsersList1.pdf';
      int count = 1;
      final String formattedDate =
          _formatDate(userlist[0]['registrationDate'].toDate());
      String fileName = '$formattedDate-UpWayUsersList.pdf';
      String path = '/storage/emulated/0/Download/$fileName';

      while (await File(path).exists()) {
        count++;
        fileName = '$formattedDate-UpWayUsersList_$count.pdf';
        path = '/storage/emulated/0/Download/$fileName';
      }

      final File file = File(path);

      await file.writeAsBytes(await pdf.save());
      // print("Path " + path);

      // Provide a message to the user that the download is complete
      Get.snackbar('Download Complete',
          'PDF file saved successfully to Download folder');
    } else {
      // Handle the case when external storage directory is null
      Get.snackbar('Error', 'Failed to get external storage directory');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}

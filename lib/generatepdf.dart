import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {

  static Future<File> generateTable(List<List<String>> data,String fileName) async {
    final pdf = Document();
    // final headers = ['Name', 'Age'];
    pdf.addPage(Page(
      build: (context) =>
          Table.fromTextArray(
            data: data,
          ),
    ));

    return saveDocument(name: fileName, pdf: pdf);
  }


  static Future<File> saveDocument({
    String name,
    Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getExternalStorageDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }
}

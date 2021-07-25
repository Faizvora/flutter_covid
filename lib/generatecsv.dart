
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GenerateCSV{

  // static generateAllTestResultCsv(List<List<String>> data,String fileName) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-AllTestResult-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  // static generatePositiveTestResultCsv(List<List<String>> data) async {
  //
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-PositiveTestResult-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  //
  // static generateNegativeTestResultCsv(List<List<String>> data) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-NegativeTestResult-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  //
  // static generateAllVaccineDoseCsv(List<List<String>> data ) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-AllVaccineDose-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  // static generateVaccineDose1Csv(List<List<String>> data ) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-VaccineDose1-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  // static generateVaccineDose2Csv(List<List<String>> data ) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-VaccineDose2-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  // static generateVaccineNoDoseCsv(List<List<String>> data ) async {
  //   String csvData = ListToCsvConverter().convert(data);
  //
  //   final String directory = (await getExternalStorageDirectory()).path;
  //
  //   final path = "$directory/csv-VaccineNoDose-${DateTime.now()}.csv";
  //   print(path);
  //   final File file = File(path);
  //   await file.writeAsString(csvData);
  //   print("File created");
  // }
  static generateCsv(List<List<String>> data,String fileName) async {
    String csvData = ListToCsvConverter().convert(data);

    var status = await Permission.storage.request();
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // final Directory directory = (await getExternalStorageDirectory());
    // Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
    // String directory = tempDir.path;

    Directory _appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name

    String newPath = "";
    print(_appDocDir);
    List<String> paths = _appDocDir.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath = newPath + "/RPSApp";
    _appDocDir = Directory(newPath);

    final Directory _appDocDirFolder = Directory(
        '${_appDocDir.path}/Covid tracker/');

    if (await _appDocDirFolder
        .exists()) { //if folder already exists return path
      return _appDocDirFolder.path;
    } else { //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder = await _appDocDirFolder.create(
          recursive: true);


      final path = "${_appDocDirNewFolder.path}/$fileName";
      print(path);
      final File file = File(path);
      await file.writeAsString(csvData);
      print("File created");
    }
  }}
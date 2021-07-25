import 'dart:io';
import 'package:covid_tracker/generatecsv.dart';
import 'package:covid_tracker/generatepdf.dart';
import 'package:covid_tracker/get_from_server.dart';
import 'package:csv/csv.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';



class DownloadReport extends StatefulWidget {
  const DownloadReport({Key key}) : super(key: key);

  @override
  _DownloadReportState createState() => _DownloadReportState();
}


class _DownloadReportState extends State<DownloadReport> {

  bool isExcelSelected = false;
  bool isPDFSelected = false;
  bool isPositiveSelected = false;
  bool isNegativeSelected = false;
  bool isDose1Selected = false;
  bool isDose2Selected = false;
  bool isNoneSelected = false;
  final snackBar = SnackBar(content: Text("File created"));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Select Data'),
      ),
      body:Container(
        width: MediaQuery. of(context). size. width,
        height: MediaQuery. of(context). size. height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.indigo],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('RT PCR data',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white

                  ),
                ),
              ),

              CheckboxListTile(
                title: Text('Positive',
                    style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
                ),
                value: isPositiveSelected,
                onChanged: (_value){
                  setState(() {
                    isPositiveSelected = _value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Negative',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                value: isNegativeSelected,
                onChanged: ( _value){
                  setState(() {
                    isNegativeSelected = _value;

                  });
                },

              ),

              Text('Vaccine data',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),),

              CheckboxListTile(
                title: Text('Dose 1',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                value:isDose1Selected,
                onChanged:(_value){
                  setState(() {
                    isDose1Selected = _value;
                  });
                } ,
              ),
              CheckboxListTile(
                title: Text('Dose 2',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),

                value:isDose2Selected,
                onChanged:(_value){
                  setState(() {
                    isDose2Selected = _value;
                  });
                } ,
              ),
              CheckboxListTile(
                title: Text('No Dose',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                value:isNoneSelected,
                onChanged:(_value){
                  setState(() {
                    isNoneSelected = _value;
                  });
                } ,
              ),

              Text('Download report format',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white

                ),),

              CheckboxListTile(
                  title: Text("Excel",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),

                  value: isExcelSelected,
                  onChanged: (_value){
                    setState(() {
                      isExcelSelected = _value;
                    });

                  }),
              CheckboxListTile(
                  title: Text("PDF",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  value: isPDFSelected,
                  onChanged: (_value){
                    setState(() {
                      isPDFSelected = _value;
                    });

              }),
              ElevatedButton(
                  child: Text('Download'),
                onPressed: ()async {

                    if (isExcelSelected) {
                      if (isPositiveSelected == true &&
                          isNegativeSelected == true) {
                        String fileName = 'All test result ${DateTime.now()}.csv';
                        var data = await getListofAllTestResult();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if (isPositiveSelected) {
                        String fileName = 'Positive test result ${DateTime.now()}.csv';
                        var data = await getListofPositiveTestResult();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if (isNegativeSelected) {
                        String fileName = 'Negative test result ${DateTime.now()}.csv';
                        var data = await getListofNegativeTestResult();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      if (isDose1Selected == true && isDose2Selected == true &&
                          isNoneSelected == true) {
                        String fileName = 'All vaccine dose ${DateTime.now()}.csv';
                        var data = await getListofAllVaccineDose();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else
                      if (isDose1Selected == true && isDose2Selected == true) {
                        String fileName = 'Vaccine Dose1 ${DateTime.now()}.csv';
                        String fileName1 = 'Vaccine Dose 2 ${DateTime.now()}.csv';

                        var data = await getListofVaccineDose1();
                        GenerateCSV.generateCsv(data,fileName);
                        var data1 = await getListofVaccineDose2();
                        GenerateCSV.generateCsv(data1,fileName1);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if (isDose1Selected == true && isNoneSelected == true) {
                        String fileName = 'Vaccine Dose1 ${DateTime.now()}.csv';
                        String fileName1 = 'No Dose ${DateTime.now()}.csv';

                        var data = await getListofVaccineDose1();
                        GenerateCSV.generateCsv(data,fileName);
                        var data1 = await getListofVaccineNoDose();
                        GenerateCSV.generateCsv(data1,fileName1);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else
                      if (isDose2Selected == true && isNoneSelected == true) {
                        String fileName = 'Vaccine Dose2 ${DateTime.now()}.csv';
                        String fileName1 = 'No Dose ${DateTime.now()}.csv';
                        var data = await getListofVaccineDose1();
                        GenerateCSV.generateCsv(data,fileName);
                        var data1 = await getListofVaccineNoDose();
                        GenerateCSV.generateCsv(data1,fileName1);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else if (isDose1Selected) {
                        String fileName ='Vaccine Dose1 ${DateTime.now()}.csv';
                        var data = await getListofVaccineDose1();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else if (isDose2Selected) {
                        String fileName ='Vaccine Dose2 ${DateTime.now()}.csv';
                        var data = await getListofVaccineDose2();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if (isNoneSelected) {
                        String fileName ='No dose ${DateTime.now()}.csv';
                        var data = await getListofVaccineNoDose();
                        GenerateCSV.generateCsv(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
/////////--------------------if PDF is selected-------------------------------------//////////////////

                    if(isPDFSelected){

                      if(isPositiveSelected == true && isNegativeSelected == true){
                        String fileName ='All test result ${DateTime.now()}.pdf';
                        var data = await getListofAllTestResult();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(isPositiveSelected){
                        String fileName ='Positive test result ${DateTime.now()}.pdf';
                        var data = await getListofPositiveTestResult();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(isNegativeSelected){
                        String fileName ='Negative test result ${DateTime.now()}.pdf';

                        var data = await getListofNegativeTestResult();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      if(isDose1Selected==true && isDose2Selected==true && isNoneSelected==true){
                        String fileName ='All Vaccine Dose ${DateTime.now()}.pdf';
                        var data = await getListofAllVaccineDose();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else if(isDose1Selected==true && isDose2Selected==true){
                        String fileName ='Vaccine Dose1 ${DateTime.now()}.pdf';
                        String fileName1 ='Vaccine Dose2 ${DateTime.now()}.pdf';
                        var data = await getListofVaccineDose1();
                        PdfApi.generateTable(data,fileName);
                        var data1= await getListofVaccineDose2();
                        PdfApi.generateTable(data1,fileName1);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(isDose1Selected ==true&& isNoneSelected==true){
                        String fileName ='Vaccine Dose1 ${DateTime.now()}.pdf';
                        String fileName1 ='Vaccine No dose ${DateTime.now()}.pdf';
                        var data = await getListofVaccineDose1();
                        PdfApi.generateTable(data,fileName);
                        var data1 = await getListofVaccineNoDose();
                        PdfApi.generateTable(data1,fileName1);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else if(isDose2Selected ==true  && isNoneSelected ==true){
                        String fileName ='Vaccine Dose2 ${DateTime.now()}.pdf';
                        String fileName1 ='Vaccine No dose ${DateTime.now()}.pdf';
                        var data = await getListofVaccineDose2();
                        PdfApi.generateTable(data,fileName);
                        var data1 = await getListofVaccineNoDose();
                        PdfApi.generateTable(data1,fileName1);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      else if(isDose1Selected ){
                        String fileName ='Vaccine Dose1 ${DateTime.now()}.pdf';
                        var data = await getListofVaccineDose1();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }

                      else if(isDose2Selected){
                        String fileName ='Vaccine Dose2 ${DateTime.now()}.pdf';
                        var data = await getListofVaccineDose2();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                      else if(isNoneSelected){
                        String fileName ='Vaccine No dose ${DateTime.now()}.pdf';
                        var data = await getListofVaccineNoDose();
                        PdfApi.generateTable(data,fileName);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                    }

                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // generateAllTestResultCsv() async {
  //   List<List<String>> data = await getListofVaccineDose1();
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
  // generatePositiveTestResultCsv() async {
  //   List<List<String>> data = await getListofPositiveTestResult();
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
  // generateNegativeTestResultCsv() async {
  //   List<List<String>> data = await getListofNegativeTestResult();
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
  // generateAllVaccineDoseCsv() async {
  //   List<List<String>> data = await getListofAllVaccineDose();
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
  // generateVaccineDose1Csv() async {
  //   List<List<String>> data = await getListofVaccineDose1();
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
  // generateVaccineDose2Csv() async {
  //   List<List<String>> data = await getListofVaccineDose2();
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
  // generateVaccineNoDoseCsv() async {
  //   List<List<String>> data = await getListofVaccineNoDose();
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

  Future<List<List<String>>> getListofAllTestResult()async{
    Map dataofTest = await getData('/rcptr_test/');
    List ListofTest = dataofTest['results'];
    List<List<String>> data=[['Names','Test Result']];
    for(var i=0;i<ListofTest.length;i++){
      data.add([ListofTest[i]['user_name'],ListofTest[i]['r_result']]);
    }
    return data;
  }



  Future<List<List<String>>> getListofPositiveTestResult()async{
    Map dataofTest = await getData('/rcptr_test/');
    List ListofTest = dataofTest['results'];
    List ListofPositiveTest = [];

    for(var i=0;i<ListofTest.length;i++){
      if(ListofTest[i]['r_result'] == 'P'){
        ListofPositiveTest.add(ListofTest[i]);
      }
    }

    List<List<String>> data=[['Names','Test Result']];
    for(var i=0;i<ListofPositiveTest.length;i++){
      data.add([ListofPositiveTest[i]['user_name'],ListofPositiveTest[i]['r_result']]);
    }
    return data;
  }

  Future<List<List<String>>> getListofNegativeTestResult()async{
    Map dataofTest = await getData('/rcptr_test/');
    List ListofTest = dataofTest['results'];
    List ListofNegativeTest = [];

    for(var i=0;i<ListofTest.length;i++){
      if(ListofTest[i]['r_result'] == 'N'){
        ListofNegativeTest.add(ListofTest[i]);
      }
    }

    List<List<String>> data=[['Names','Test Result']];
    for(var i=0;i<ListofNegativeTest.length;i++){
      data.add([ListofNegativeTest[i]['user_name'],ListofNegativeTest[i]['r_result']]);
    }
    return data;
  }


  Future<List<List<String>>> getListofAllVaccineDose()async{
    Map dataofTest = await getData('/vaccine_test/');
    List ListofTest = dataofTest['results'];
    List<List<String>> data=[['Names','Dose']];

    for(var i=0;i<ListofTest.length;i++){
      data.add([ListofTest[i]['user_name'],ListofTest[i]['dose']]);
    }
    return data;
  }

  Future<List<List<String>>> getListofVaccineDose1()async{
    Map dataofTest = await getData('/vaccine_test/');
    List ListofVaccine = dataofTest['results'];
    List ListofDose1 = [];

    for(var i=0;i<ListofVaccine.length;i++){
      if(ListofVaccine[i]['dose'] == '1'){
        ListofDose1.add(ListofVaccine[i]);
      }
    }
    List<List<String>> data=[['Names','Dose']];
    for(var i=0;i<ListofDose1.length;i++){
      data.add([ListofDose1[i]['user_name'],ListofDose1[i]['dose']]);
    }
    return data;
  }

  Future<List<List<String>>> getListofVaccineDose2()async{
    Map dataofTest = await getData('/vaccine_test/');
    List ListofVaccine = dataofTest['results'];
    List<List<String>> data=[['Names','Dose']];
    for(var i=0;i<ListofVaccine.length;i++){
      data.add([ListofVaccine[i]['user_name'],ListofVaccine[i]['dose']]);
    }
    return data;
  }

  Future<List<List<String>>> getListofVaccineNoDose()async{
    Map dataofTest = await getData('/vaccine_test/');
    List ListofVaccine = dataofTest['results'];
    List ListofDose0 = [];

    for(var i=0;i<ListofVaccine.length;i++){
      if(ListofVaccine[i]['dose'] == '0'){
        ListofDose0.add(ListofVaccine[i]);
      }
    }
    List<List<String>> data=[['Names','Dose']];
    for(var i=0;i<ListofDose0.length;i++){
      data.add([ListofDose0[i]['user_name'],ListofDose0[i]['dose']]);
    }
    return data;
  }
}



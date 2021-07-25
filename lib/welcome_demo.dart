
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:covid_tracker/get_from_server.dart';
import 'package:covid_tracker/set_vars.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';



class WelcomeScreenDemo extends StatefulWidget {
  @override
  _WelcomeScreenDemoState createState() => _WelcomeScreenDemoState();
}

class _WelcomeScreenDemoState extends State<WelcomeScreenDemo> {

  bool test;
  String username;
  DateTime vaccineDate;
  DateTime testDate;

  bool rcptrBtnState = true;
  bool rcptrCounterColor = false;

  bool vaccineBtnState = true;
  bool vaccineCounterColor = false;
  bool vaccinePos = false;
  bool vaccineNeg = false;
  String vaccineMessage = '';

  List rcptrDetails = [];
  List vaccineDetails = [];

  Duration rcptrDuration;
  Duration vaccineDuration;

  bool isMorning,isAfternoon,isEvening,isNight;

  // void updateCounterByDose() {
  //   String rawDate = vaccineDetails[0]['upload_date_time'];
  //   DateTime update = DateTime.tryParse(rawDate);
  //   DateTime next21days = update.add(Duration(days: 21));
  //   DateTime today = DateTime.now();
  //   if (!next21days.difference(today).isNegative) {
  //     vaccineDuration = Duration(seconds: next21days.difference(today).inSeconds);
  //   } else {
  //     vaccineDuration = Duration(seconds: 3);
  //   }
  // }

  String bgImage;
  String greetingMessage;
  // GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/days.txt');
  }

  Future<void> readCounter() async {
    try {
      final file = await _localFile;
      DateTime now = DateTime.now();
      // Read the file
      final contents = await file.readAsString();
      print(contents.split('-'));
      List contentList = contents.split('-');
      if(contentList[0] == now.day.toString() && contentList[1] == now.month.toString() && contentList[2] == now.year.toString()){
        print("same date");
        test = true;
      }
      else{
        print("Not same date");
        test = false;
      }
      // return DateTime.tryParse(contents);
    } catch (e) {
      test = false;
      // If encountering an error, return 0
      // return DateTime.now().subtract(Duration(days: 1));
    }
  }

  Future<void> writeCounter(DateTime date) async {
    final file = await _localFile;
    // Write the file
    print(date.day.toString() +'-'+date.month.toString()+'-'+date.year.toString());
    file.writeAsString(date.day.toString() +'-'+date.month.toString()+'-'+date.year.toString());
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCounter();
    // writeCounter(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {

    final snackBar = SnackBar(content: Text('File uploaded'));
    Map data = ModalRoute.of(context).settings.arguments;
    username = data['username'];
    rcptrDetails = data['rcptr'];
    vaccineDetails = data['vaccine'];

    String rcptrResult = rcptrDetails[0]['r_result'];
    String vaccineDose = vaccineDetails[0]['dose'];
    String presentvaccineDose = vaccineDose;
    String futurevaccineDose;

    testDate = DateTime.tryParse(rcptrDetails[0]['update_date_time']);
    vaccineDate = DateTime.tryParse(vaccineDetails[0]['upload_date_time']);
    String testDateString = DateFormat('dd-MMM-yyyy').format(testDate);
    String vaccineDateString = DateFormat('dd-MMM-yyyy').format(vaccineDate);

    DateTime now = DateTime.now();
    isMorning = now.hour>=6 && now.hour<=12? true:false;
    isAfternoon = now.hour>=13 && now.hour<=16? true:false;
    isEvening = now.hour>=17 && now.hour<=20? true:false;
    isNight = now.hour>=21 || now.hour>=0? true:false;

    if(isMorning){
      setState(() {
        bgImage = 'morning.jpg';
        greetingMessage = 'Good Morning';
      });
    }
    else if(isAfternoon){
      setState(() {
        bgImage = 'afternoon.jpg';
        greetingMessage = 'Good Afternoon';
      });
    }
    else if(isEvening){
      setState(() {
        bgImage = 'evening.jpg';
        greetingMessage = 'Good Evening';
      });
    }
    else if(isNight){
      setState(() {
        bgImage = 'night.jpg';
        greetingMessage = 'Good Night';
      });
    }

    rcptrDuration = Duration(days:testDate.difference(now).inDays);
    vaccineDuration = Duration(days:vaccineDate.difference(now).inDays);

    while(rcptrDuration.inDays.isNegative){
      setState(() {
        testDate = testDate.add(Duration(days: 8));
         testDateString = DateFormat('dd-MMM-yyyy').format(testDate);
        rcptrDuration = Duration(days:testDate.difference(now).inDays);
      });
    }

    while(vaccineDuration.inDays.isNegative){
      setState(() {
        print(true);
        vaccineDate = vaccineDate.add(Duration(days: 21));
        vaccineDateString = DateFormat('dd-MMM-yyyy').format(vaccineDate);
        vaccineDuration = Duration(days:vaccineDate.difference(now).inDays);

      });
    }

    if(vaccineDose == '0'){
      setState(() {
        futurevaccineDose = '1';
      });
    }

    else if(vaccineDose == '1'){
      setState(() {
        futurevaccineDose = '2';
      });
    }
    else if(vaccineDose == '2'){
      setState(() {
        futurevaccineDose = '3';
      });
    }

  // if (rcptrDetails[0]['r_result'] == 'P'){
    //   setState(() {
    //     rcptrDuration = Duration(seconds: 1);
    //   });
    // } else {
    //   String rawDate = rcptrDetails[0]['update_date_time'];
    //   DateTime update = DateTime.tryParse(rawDate);
    //   DateTime next8days = update.add(Duration(days: 8));
    //   DateTime today = DateTime.now();
    //
    //   if (!next8days.difference(today).isNegative) {
    //     rcptrDuration = Duration(seconds: next8days.difference(today).inSeconds);
    //   } else {
    //     rcptrDuration = Duration(seconds: 5);
    //   }
    // }
    //
    // if (vaccineDetails[0]['dose'] == '0') {
    //   vaccineDuration = Duration(seconds: 1);
    //   vaccineMessage = 'DOSE 1';
    // } else if (vaccineDetails[0]['dose'] == '1') {
    //   updateCounterByDose();
    //   vaccineMessage = 'DOSE 2';
    // } else if (vaccineDetails[0]['dose'] == '2') {
    //   updateCounterByDose();
    //   vaccineMessage = 'DOSE 3';
    // } else if(vaccineDetails[0]['dose'] == '3'){
    //   // vaccineCounterColor = true;
    //   // vaccineBtnState = true;
    // } else {
    //   updateCounterByDose();
    // }
    //
    // if(rcptrDuration.inDays == 0){
    //   rcptrBtnState = false;
    // }
    // if(vaccineDuration.inDays == 0){
    //   vaccineBtnState = false;
    // }
    return test == false?
       Scaffold(
           body: Container(
             height: MediaQuery. of(context). size. height,
             decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Colors.purple, Colors.indigo],
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                 )
             ),
           child: AlertDialog(
             title: const Text('Vaccine'),
             content: SingleChildScrollView(
               child: ListBody(
                 children: const <Widget>[
                   Text('What is your Covid Report?'),
                   // Text('Would you like to approve of this message?'),
                 ],
               ),
             ),
             actions: <Widget>[
               TextButton(
                 child: const Text('Negative'),
                 onPressed: () async {
                   writeCounter(DateTime.now());
                   bool success = await postResult(username,"N");
                   List rcptrDetails = await getTestDetailsByUser(username, '/rcptr_test/');
                   List vaccineDetails = await getTestDetailsByUser(username, '/vaccine_test/');
                   Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                     'username': username,
                     'rcptr': rcptrDetails,
                     'vaccine': vaccineDetails,
                   });
                 },
               ),
               TextButton(
                 child: const Text('Positive'),
                 onPressed: () async {
                   writeCounter(DateTime.now());
                   bool success = await postResult(username,"P");
                   List rcptrDetails = await getTestDetailsByUser(username, '/rcptr_test/');
                   List vaccineDetails = await getTestDetailsByUser(username, '/vaccine_test/');
                   Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                     'username': username,
                     'rcptr': rcptrDetails,
                     'vaccine': vaccineDetails,
                   });
                 },
               ),
             ],
           ),
           )
       ):

    Scaffold(
      body: Container(
        height: MediaQuery. of(context). size. height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: MediaQuery. of(context). size. width,
                  height: 256,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Assets/$bgImage'),
                        fit: BoxFit.fitWidth
                      )
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,30.0,8.0,0),
                            child: ButtonTheme(
                              buttonColor: Colors.white,
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              child: RaisedButton(
                                  child:Row(
                                    children: [
                                      Icon(Icons.logout,
                                      color:Colors.black,),
                                      Text('Logout')
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, '/');
                              }
                              ),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(greetingMessage,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color:greetingMessage == 'Good Night'?Colors.white:Colors.black,
                                  fontWeight:FontWeight.bold
                                ),
                            ),
                            Text(username,
                              style: TextStyle(
                                fontSize: 30.0,
                                color: greetingMessage == 'Good Night'?Colors.white:Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),


              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                   elevation: 26.0,
                                   shadowColor:Colors.black87,
                                  child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text('RT PCR',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                            ),
                                          ),
                                          Text('Result',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          Text(rcptrResult=='N'?'Negative':'Positive',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: rcptrResult=='N'?Colors.green:Colors.red,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Text('Date',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                ),
                         ),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                    elevation: 26.0,
                                    shadowColor:Colors.black87,
                                    child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text('Vaccine',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            Text('Dose ',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,

                                              ),
                                            ),
                                            Text( vaccineDose=='0'?"No dose taken":'Dose $vaccineDose ',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top:8.0),
                                              child: Text('Date',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                  ),
                         ),
                       ],
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('APPOINTMENTS',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      elevation: 26.0,
                      shadowColor:Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:ListTile(
                          leading:ClipOval(
                            child: Image(image:AssetImage('Assets/test.png')),
                          ),
                          title: Text('Test date '+testDateString,
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(rcptrDuration.inDays == 0? "Today":rcptrDuration.inDays.toString()+" Days to go",
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                  LinearProgressIndicator(
                                      value: 1.0-(rcptrDuration.inDays.toInt()/10),
                                    ),
                              ],
                            ),
                          ),

                         )
                      )
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        elevation: 26.0,
                        shadowColor:Colors.black87,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:ListTile(
                            leading:ClipOval(
                              child: Image(image:AssetImage('Assets/vaccine.png')),
                            ),
                            title: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Vaccine date '+vaccineDateString,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Dose '+ futurevaccineDose,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(vaccineDuration.inDays == 0? "Today":vaccineDuration.inDays.toString()+" Days to go",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  LinearProgressIndicator(
                                      value: 1.0-(vaccineDuration.inDays.toInt()/21),
                                    ),
                                ],
                              ),
                            ),

                          )
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('DOCUMENTS',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ),
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Card(
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      //       elevation: 26.0,
                      //       shadowColor:Colors.black87,
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text('RT PCR',
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   fontWeight: FontWeight.bold,),),
                      //             Text('Reports',
                      //               style: TextStyle(
                      //                 fontSize: 20.0,
                      //                 fontWeight: FontWeight.bold,),),
                      //             Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: ElevatedButton(onPressed: (){}, child: Text('Choose file')),
                      //             )
                      //
                      //           ],
                      //         ),
                      //       )
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          elevation: 26.0,
                          shadowColor:Colors.black87,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('Vaccine Certificate',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,),),
                              subtitle:  ElevatedButton(child: Text('Choose file'),
                                  onPressed: ()async {
                                    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'pdf']);
                                    if (result != null) {
                                      File file = File(result.files.single.path);
                                      print(username);
                                      print(file.path);
                                      print(file);
                                      print(futurevaccineDose);
                                      bool success = await postDoc(username, futurevaccineDose, file, file.path);
                                      if (success) {
                                        List rcptrDetails = await getTestDetailsByUser(username, '/rcptr_test/');
                                        List vaccineDetails = await getTestDetailsByUser(username, '/vaccine_test/');
                                        Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                                          'username': username,
                                          'rcptr': rcptrDetails,
                                          'vaccine': vaccineDetails,
                                        });
                                      }
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }

                                  }),
                            ),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Card(
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      //       elevation: 26.0,
                      //       shadowColor:Colors.black87,
                      //       child:
                      //         Padding(
                      //           padding: const  EdgeInsets.all(16.0),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text('Vaccine',
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   fontWeight: FontWeight.bold,),),
                      //               Text('Certificate',
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   fontWeight: FontWeight.bold,),),
                      //               ElevatedButton(child: Text('Choose file'),
                      //                 onPressed: ()async {
                      //                   FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'pdf']);
                      //                   if (result != null) {
                      //                     File file = File(result.files.single.path);
                      //                     print(username);
                      //                     print(file.path);
                      //                     print(file);
                      //                     print(vaccineMessage.substring(5));
                      //                     bool success = await postDoc(username, vaccineMessage.substring(5), file, file.path);
                      //                     if (success) {
                      //                       List rcptrDetails = await getTestDetailsByUser(username, '/rcptr_test/');
                      //                       List vaccineDetails = await getTestDetailsByUser(username, '/vaccine_test/');
                      //                       Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                      //                         'username': username,
                      //                         'rcptr': rcptrDetails,
                      //                         'vaccine': vaccineDetails,
                      //                       });
                      //                     }
                      //                   }
                      //
                      //                 }),
                      //
                      //             ],
                      //           ),
                      //         ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


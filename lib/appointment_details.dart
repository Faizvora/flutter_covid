import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'get_from_server.dart';
import 'package:file_picker/file_picker.dart';

class AppointmentDetails extends StatefulWidget {
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  var appointment;
  String appointDetails =
      "If you're visiting this page, you're likely here because you're searching for a random sentence. Sometimes a random word just isn't enough, and that is where the random sentence generator comes into play. By inputting the desired number, you can make a list of as many random sentences as you want or need. Producing random sentences can be helpful in a number of different ways.";
  @override
  Widget build(BuildContext context) {
    appointment = ModalRoute.of(context).settings.arguments;
    var name = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Appointment Details"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.indigo],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, bottom: 8.0, left: 8.0),
                  child: Text(
                    appointment['appointment'].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(appointDetails,
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File file = File(result.files.single.path);
                      FetchData fetch = FetchData();
                      // todo: working further

                      bool success = await fetch.postDoc(
                          appointment['username'].toString(), file.path, file);
                      if (success) {
                        Widget okbtn = TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'));
                        AlertDialog alert = AlertDialog(
                          title: Text('Result:'),
                          content: Text('File uploaded successfully'),
                          actions: [
                            okbtn,
                          ],
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });
                      } else {
                        //
                      }
                    }
                  },
                  child: Text("Upload Documents"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

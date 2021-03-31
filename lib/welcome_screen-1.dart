import 'package:covid_vaccine/get_from_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'appointment_details.dart';
import 'login2.dart';

class WelcomeScreen extends StatefulWidget {
  final String username;
  WelcomeScreen({Key key, this.username}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  List<String> appointment = [
    "Appointment 1",
    "Appointment 2",
    "Appointment 3",
  ];

  var body;

  List<String> get_appointment_value(int app_no) {
    List<String> temp = [];
    switch (app_no) {
      case 1:
        {
          temp.add('Vaccine');
        }
        break;
      case 2:
        {
          temp.add('RP-CTR');
        }
        break;
      default:
        {
          temp.add('ALL DONE');
        }
    }
  }

  void get_apps() async {
    FetchData fetch = FetchData();
    body = await fetch.get_appointments();
    // print(body['results'][0]);

    for (int i = 0; i < body['results'].length; i++) {
      var data = body['results'][i];
      if (data['username'] == widget.username) {
        print(body['results'][i]);
        appointment = get_appointment_value(data['appointment_type']);
      }
    }
  }

  void initState() {
    super.initState();
    // get_apps();
  }

  Widget build(BuildContext context) {
    var name = widget.username;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Welcome, " + name),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              // PopupMenuItem(
              //     value: 'Setting',
              //     child: Row(
              //       children: [
              //         Icon(Icons.settings, color: Colors.purple),
              //         Text(
              //           '  Settings',
              //           style: TextStyle(color: Colors.black),
              //         )
              //       ],
              //     )),
              // PopupMenuItem(
              //     value: 'Help',
              //     child: Row(
              //       children: [
              //         Icon(Icons.help, color: Colors.purple),
              //         Text(
              //           '  Help',
              //           style: TextStyle(color: Colors.black),
              //         )
              //       ],
              //     )),
              PopupMenuItem(
                value: 'Logout',
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');

                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.purple),
                      Text(
                        '  Logout',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
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
                  padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                  child: Text(
                    'Appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 10.0, right: 10.0),
                    child: ListView.builder(
                      itemCount: appointment.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/Appointmentdetails',
                                  arguments: {
                                    'appointment': appointment[index],
                                    'username': widget.username,
                                  });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    appointment[index],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(onPressed: (){},
                      child: Text("New Appointment")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

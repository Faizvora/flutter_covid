import 'package:covid_vaccine/get_from_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'appointment_details.dart';
import 'login2.dart';
import 'package:intl/intl.dart';
class WelcomeScreen extends StatefulWidget {
  //final String username;
  // WelcomeScreen({Key key, this.username, Key key1, this.futureList,Key key3, this.pastList}) : super(key: key,key1: key1 ,key3: key3 );

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List futureList=[];
  List pastList=[];
  String future_appointment_type;
  String past_appointment_type;
  var body;


  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    print('build');
    Map data = ModalRoute.of(context).settings.arguments;
    print(data);
    futureList = data['futureList'];
    pastList = data['pastList'];

    for(var i=0; i<futureList.length; i++){

      future_appointment_type = futureList[i]['appointment_type'].toString().contains('1')?'Vaccine':'RC-PTR';
    }

    for(var i=0; i<pastList.length; i++) {
      past_appointment_type = pastList[i]['appointment_type'].toString().contains('1')?'Vaccine':'RC-PTR';
    }

    var name = data['username'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Welcome, " + name),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
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
                    'Future appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                 SizedBox(
                  height:200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 10.0, right: 10.0),
                    child: ListView.builder(
                      itemCount: futureList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/Appointmentdetails',
                                  arguments: {
                                    'appointment': futureList[index],
                                    'username': name,
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
                                  child: Row(
                                    children: [
                                      Text(

                                        future_appointment_type + ' |  ',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        futureList[index]['appointment_date_time'].toString().substring(0,10),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
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
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                  child: Text(
                    'Past appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                SizedBox(
                  height:200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 10.0, right: 10.0),
                    child: ListView.builder(
                      itemCount: pastList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/Appointmentdetails',
                                  arguments: {
                                    'appointment': pastList[index],
                                    'username': name,
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
                                  child: Row(
                                    children: [
                                      Text(
                                        past_appointment_type+ ' |  ',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        pastList[index]['appointment_date_time'].toString().substring(0,10),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'get_from_server.dart';
import 'total_users.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  var firstname ;
  var lastname ;
  var emailid;
  var mobile;
  String doc;
  var userappointments_date_time;
  var userappointments_type;
  var userappointments_created_date;
  var userappointments_created_by;


  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    firstname = data['userdata']['firstname'];
    lastname = data['userdata']['lastname'];
    emailid = data['userdata']['email_id'];
    mobile = data['userdata']['mobile_no'];
    doc = data['userdocs'];
    userappointments_date_time = data['userappointments_date_time'];
    userappointments_type = data['userappointments_type'];
    userappointments_created_date = data['userappointments_created_date'];
    userappointments_created_by = data['userappointments_created_by'];

    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Summary"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.indigo],
          ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name : ' + firstname,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Surname : ' + lastname,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email ID : ' + emailid,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Mobile No : ' + mobile.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed:(){},
                      child: Text(
                          doc==null?'No document uploaded':'View Document'
                      )),
                ],

              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 child: userappointments_date_time==null?Text('No Appointments'):
                 Column(
                   children: [
                     Text('Appointment date time : ' + userappointments_date_time),
                     Text('Appointment type : ' + userappointments_type.toString() == 1.toString()?'Vaccine':'PC-PTR'),
                     Text('Appointment created date : ' + userappointments_created_date),
                     Text('Appointment created by : ' + userappointments_created_by.toString() == 1.toString()?'Admin':'User'),
                   ],
                 ),
               ),
             ),
            )],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'get_from_server.dart';

class TotalAppointments extends StatefulWidget {
  @override
  _TotalAppointmentsState createState() => _TotalAppointmentsState();
}

class _TotalAppointmentsState extends State<TotalAppointments> {
  List<String> username = [];
  List<int> appointment_type = [];
  List<String> appointment_date_time = [];
  List<String> created_date = [];
  List<int> created_by = [];
  String date_appointment;
  String date_created;
  String user,appointment;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    user = data['username'];
    for (var i=0; i<data['appointment_details'].length;i++) {
      username.insert(i, data['appointment_details'][i]['username']);
      appointment_type.insert(i, data['appointment_details'][i]['appointment_type']);


      DateTime now = DateTime.parse(data['appointment_details'][i]['appointment_date_time']);
      date_appointment = DateFormat('yyyy-MM-dd').format(now);
      appointment_date_time.insert(i,date_appointment);

      DateTime now1 = DateTime.parse(data['appointment_details'][i]['created_date']);
      date_created = DateFormat('yyyy-MM-dd').format(now1);
      created_date.insert(i,date_created);

      created_by.insert(i, data['appointment_details'][i]['created_by']);
      // appointment = appointment_type[i].toString().contains('1')?'Vaccine':'RC-PTR';
      //appointment = appointment_type[i].toString();
      print(date_created);
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'Create appointment',
                child: GestureDetector(
                  onTap: ()async{
                    FetchData fetchData = FetchData();
                    var body = await fetchData.getAllUser();
                    var body_apptype = await fetchData.getAppointmentType();
                    var body_createdby = await fetchData.getCreatedBy();
                    List list = body['results'];
                    List namesList=<String>[];
                    for(var i=0; i<list.length; i++){
                      namesList.insert(i,body['results'][i]['username']);
                    }

                    List apptype = body_apptype['results'];
                    List appList=<String>[];
                    for(var i=0; i<apptype.length; i++){
                      appList.insert(i,body_apptype['results'][i]['appointment_type']);
                    }
                    List createdby = body_createdby['results'];
                    List createdbylist=<String>[];
                    for(var i=0; i<createdby.length; i++){
                      createdbylist.insert(i,body_createdby['results'][i]['admin_user']);
                    }
                    Navigator.pushReplacementNamed(context, '/createappointment',arguments: {'username':user,'userlist':namesList,'appList':appList});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.create, color: Colors.purple),
                      Text(
                        '  Create appointment',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],

        title: Text('Total Appointments'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.purple, Colors.indigo],
        )),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
          child: ListView.builder(
            itemCount: username.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                                username[index],
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                          ),

                         Padding(
                           padding: const EdgeInsets.only(left:8.0),
                           child: Text(
                             "Appointment type: " + appointment_type[index].toString(),
                             style: TextStyle(
                               fontSize: 18.0,
                               color: Colors.black,
                             ),
                           ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                           "Appointment date: "+ appointment_date_time[index],
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            "Created date: " + date_created,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            "Created by: "+ user,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

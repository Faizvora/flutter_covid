import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;

    for (var i=0; i<data.length;i++) {
      username.insert(i, data['appointment_details'][i]['username']);
      appointment_type.insert(i, data['appointment_details'][i]['appointment_type']);
      appointment_date_time.insert(i, data['appointment_details'][i]['appointment_date_time']);
      created_date.insert(i, data['appointment_details'][i]['created_date']);
      created_by.insert(i, data['appointment_details'][i]['created_by']);

    }
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
                             appointment_type[index].toString().contains('1')?'Vaccine':'RC-PTR',
                             style: TextStyle(
                               fontSize: 18.0,
                               color: Colors.black,
                             ),
                           ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            appointment_date_time[index],
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            created_date[index],
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            created_by[index].toString(),
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

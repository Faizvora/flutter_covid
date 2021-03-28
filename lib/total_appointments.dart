import 'package:flutter/material.dart';

class TotalAppointments extends StatefulWidget {
  @override
  _TotalAppointmentsState createState() => _TotalAppointmentsState();
}

class _TotalAppointmentsState extends State<TotalAppointments> {
  List<String> appointments = [
    'Appointment 1',
    'Appointment 2',
    'Appointment 3',
    'Appointment 4',
    'Appointment 5',
    'Appointment 6',
    'Appointment 7',
    'Appointment 8',
  ];

  @override
  Widget build(BuildContext context) {
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
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
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
                      child: Text(
                        appointments[index],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
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
    );
  }
}

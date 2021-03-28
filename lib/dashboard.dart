import 'package:covid_vaccine/get_from_server.dart';
import 'package:flutter/material.dart';
import 'total_doc.dart';
import 'total_users.dart';
import 'total_tests.dart';
import 'total_appointments.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int user = 19;
  int appointments = 8;
  int documents = 10;
  int tests = 5;

  void set_all() async {
    FetchData fetchData = FetchData();
    this.user = await fetchData.get_n_users();
    this.appointments = await fetchData.get_n_appointments();
    this.tests = await fetchData.get_n_tests();
    this.documents = await fetchData.get_n_tests();
  }

  @override
  Widget build(BuildContext context) {
    // set_all();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 60, 2, 0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TotalUsers()),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    child: Text(
                      'USER : ' + user.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                  ),
                )),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TotalDoc()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  child: Text(
                    'DOCUMENTS : ' + documents.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TotalTests()));
              },
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  child: Text(
                    'TESTS : ' + tests.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TotalAppointments()));
              },
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  child: Text('APPOINTMENT : ' + appointments.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

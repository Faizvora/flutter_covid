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
  int user ;
  int appointments;
  int documents;
  int tests ;
  String username;
  @override
  Widget build(BuildContext context) {
    Map count =  ModalRoute.of(context).settings.arguments;
    username = count['username'];
   user = count['usercount'];
   documents = count['docscount'];
   tests = count['testcount'];
   appointments = count['appointmentcount'];
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Dashboard"),
        actions: [
              PopupMenuItem(
                value: 'Logout',
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.purple),
                      Text(
                        '  Logout',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.indigo],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
        padding: EdgeInsets.fromLTRB(20, 60, 2, 0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
                onTap: () async  {
                  FetchData fetchData = FetchData();
                  var body = await fetchData.getAllUser();
                  List list = body['results'];
                  List namesList=<String>[];
                  for(var i=0; i<list.length; i++){
                    namesList.insert(i,body['results'][i]['username']);
                  }
                  Navigator.pushNamed(context, '/totalusers',arguments: {'namesList':namesList,'username':username} );

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
              onTap: () async {
                FetchData fetchData = FetchData();
                var docdetails = await fetchData.getAlldocs();
                List list = docdetails['results'];
                List namesList=<String>[];
                for(var i=0; i<list.length; i++){
                  namesList.insert(i,docdetails['results'][i]['username']);
                }
                Navigator.pushNamed(context,'/totaldocs',arguments: {'namesList':namesList});
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
              onTap: () async{
                FetchData fetchData = FetchData();
                var body = await fetchData.get_tests();
                Navigator.pushNamed(context, '/totaltest',arguments: {'totaltest':body['results'],'username':username});
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
              onTap: ()async {
                FetchData fetchData = FetchData();
                var appointment_details = await fetchData.get_appointments();
                var appointmentList = appointment_details['results'];
                // Map list;
                // for(var i=0; i<appointmentList.length; i++) {
                //   list.addEntries(appointment_details['results'][i]);
                // }

                Navigator.pushNamed(context, '/totalappointments',arguments: {'appointment_details':appointmentList,'username':username});
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

import 'package:covid_tracker/download_report.dart';
import 'package:covid_tracker/set_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserDetailScreen extends StatefulWidget {
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  
  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0,);
  List users;
  bool isSwitched = false;
  Future<void> loadData() async {
    users = await setSummayData('/users_tbl/');
    print(users);
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('User details'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:16.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:16.0),
                      child: PopupMenuButton(
                        child: Center(child:Icon(Icons.more_vert)),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                              value: index,
                              child: Text('Download Report'),
                            );
                          });
                        },
                        onSelected: (index){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DownloadReport()),
                          );

                        },
                        onCanceled: () {
                          print('cancelled!');
                        },
                      ),
                    ),
                  ),]
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text("${users[index]['firstname']} ${users[index]['lastname']}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Text("Username: ${users[index]['username']}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text("Email ID: ${users[index]['email_id']}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text("Mobile No: ${users[index]['mobile_no']}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ), 
                              ],
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
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('User details'),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
              child: Center(child:SpinKitPouringHourglass(
                color: Colors.white,
                size: 50.0,
              )
              ),
            ),
          );
        }
      },
    );
  }
}
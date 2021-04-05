import 'package:flutter/material.dart';

import 'get_from_server.dart';

class TotalUsers extends StatefulWidget {
  @override
  _TotalUsersState createState() => _TotalUsersState();
}

class _TotalUsersState extends State<TotalUsers> {

  var _controller = TextEditingController();
  List userList = <String>[];
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    Map data  = ModalRoute.of(context).settings.arguments;
    userList = data['namesList'];
    String username = data['username'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
          title: !isSearching
              ? Text("Total Users")
              : TextField(
                  cursorColor: Colors.white,
                  controller: _controller,
                  onSubmitted:(String text) {
                    setState(() {
                      if (userList.contains(_controller.text)){
                        userList.clear();
                        userList.insert(0, _controller.text);
                      }
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white))),
          actions: <Widget>[
            isSearching
                ? IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this.isSearching = false;
                });
              },
            )
                : IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              },
            )
          ]),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.indigo],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
          child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: GestureDetector(
                  onTap: ()async{
                    FetchData fetchData = FetchData();
                    var userdata = await fetchData.getUser(userList[index]);
                    var docdata = await fetchData.getAlldocs();
                    var appointmentdata = await fetchData.get_appointments();

                    List docslist = docdata['results'];
                    List appointmentlist = appointmentdata['results'];

                    var userdocs;
                    for(var i=0; i<docslist.length; i++){
                      if(docslist[i]['username']== userList[index]){
                         userdocs = docslist[i]['file_upload'];
                      }
                    }

                    var userappointments_date_time;
                    var userappointments_type;
                    var userappointments_created_date;
                    var userappointments_created_by;

                    for(var i=0; i<appointmentlist.length; i++){
                      if(appointmentlist[i]['username']== userList[index]){
                        userappointments_date_time = appointmentlist[i]['appointment_date_time'];
                        userappointments_type = appointmentlist[i]['appointment_type'];
                        userappointments_created_date = appointmentlist[i]['created_date'];
                        userappointments_created_by = appointmentlist[i]['created_by'];
                      }
                    }
                    Navigator.pushNamed(context, '/usersummary',arguments: {'userdata':userdata,'userdocs':userdocs,'userappointments_date_time':userappointments_date_time,
                                                                             'userappointments_type':userappointments_type,'userappointments_type':userappointments_type,
                                                                                'userappointments_created_date':userappointments_created_date,'userappointments_created_by':username});
                  },
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
                        child: Text(userList[index],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            )),
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

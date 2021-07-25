import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'set_vars.dart';

class RCPTRScreen extends StatefulWidget {
  @override
  _RCPTRScreenState createState() => _RCPTRScreenState();
}

class _RCPTRScreenState extends State<RCPTRScreen> {

  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0,);
  List details;

  Future<void> loadData() async {
    details = await setDetails('/rcptr_test/');
    // print(details);
    // String name = await getFirstnameLastname(details[1]['user_name']);
    // print(name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('RC-PTR details'),
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
                  itemCount: details.length,
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
                            //    
                            child: FutureBuilder(
                              future: getFirstnameLastname(details[index]['user_name']),
                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                if (snapshot.connectionState == ConnectionState.done){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text("${details[index]['r_result'] == 'P' ? 'POSITIVE' : 'NEGATIVE'}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: details[index]['r_result'] == 'P' ? Colors.red : Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6.0),
                                      
                                      Text("Update date: ${details[index]['update_date_time'].toString().substring(0, 10)}",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return SpinKitCubeGrid(color: Colors.white, size: 50.0,);
                                  // return KSpinkit(title: 'RC-PTR details',);
                                }
                              },
                            )
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
              title: Text('RC-PTR details'),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
              child: Center(
                  child:SpinKitPouringHourglass(
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
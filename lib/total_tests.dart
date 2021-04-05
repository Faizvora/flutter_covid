import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalTests extends StatefulWidget {
  @override
  _TotalTestsState createState() => _TotalTestsState();
}

class _TotalTestsState extends State<TotalTests> {
  List<String> username = [];
  List<int> test_type = [];
  List<String> file_upload = [];
  List<String> test_date = [];
  List<String> created_date = [];
  //List<int> created_by = [];
  String created_by ;
  List<bool> is_active = [];
  String date_test;
  String date_created;
  @override
  Widget build(BuildContext context) {
    Map data  = ModalRoute.of(context).settings.arguments;

    created_by = data['username'];
    for(var i=0; i<data.length; i++){
      username.insert(i, data['totaltest'][i]['username']);
      test_type.insert(i, data['totaltest'][i]['test_type']);
      file_upload.insert(i, data['totaltest'][i]['file_upload']);

      test_date.insert(i, data['totaltest'][i]['test_date']);
      DateTime now = DateTime.parse(test_date[i]);
      date_test = DateFormat.jm().format(now);

      created_date.insert(i, data['totaltest'][i]['created_date']);
      DateTime now1 = DateTime.parse(created_date[i]);
      date_created =  DateFormat.jm().format(now1);

      //created_by.insert(i, data['totaltest'][i]['created_by']);
      is_active.insert(i, data['totaltest'][i]['is_active']);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Total Tests'),
        backgroundColor: Colors.purple,
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
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              username[index],
                              style: TextStyle(fontSize: 22.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              // "Test Type: "+ test_type[index].toString() == 1.toString()?'PC-PTR':'Vaccine',
                                test_type[index].toString(),
                              style: TextStyle(fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              "Test date: "+date_test,
                              style: TextStyle(fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              "Created date: "+date_created,
                              style: TextStyle(fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(
                              "Created by: "+created_by,
                              style: TextStyle(fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,bottom: 8.0),
                            child: Text(
                              "Is active: "+is_active[index].toString(),
                              style: TextStyle(fontSize: 15.0, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed:(){},
                            child:Text('View Document')),
                      )
                    ],
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

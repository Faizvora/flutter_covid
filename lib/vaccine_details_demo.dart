import 'package:flutter/material.dart';
import 'set_vars.dart';


class VaccineScreenDemo extends StatefulWidget {
  @override
  _VaccineScreenDemoState createState() => _VaccineScreenDemoState();
}

class _VaccineScreenDemoState extends State<VaccineScreenDemo> {

  List details;
  var searchController = TextEditingController();
  List<String> userList = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: !isSearching
          ? Text('Document details')
          : TextField(
            cursorColor: Colors.white,
            controller: searchController,
            onSubmitted: (String text){
              setState(() {
                if (userList.contains(searchController.text)){
                  userList.clear();
                  userList.add(searchController.text);
                }
              });
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
              icon: Icon(Icons.search, color: Colors.white),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
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
            ),
            IconButton(
              icon: Icon(Icons.auto_awesome),
              onPressed: () {

              },
            )
          ],
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userList[0],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text("${details[index]['dose'] == '0' ? 'NO' : details[index]['dose']} DOSE",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: details[index]['dose'] == '0' ? Colors.red : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("UPDATE DATE: ${details[index]['upload_date_time'].toString().substring(0, 10)}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   child: Text('VIEW DOCUMENT'),
                              //   style: ButtonStyle(
                              //     backgroundColor: MaterialStateProperty<Color>?(Colors.purple),
                              //   ),
                              // )
                              details[index]['dose'] == '0' ?
                              Container(height: 40,) :
                              OutlinedButton(
                                onPressed: () {},
                                child: Text('VIEW DOCUMENT', style: TextStyle(color: Colors.purple),),
                                style: ButtonStyle(
                                  side: MaterialStateProperty.resolveWith((states){
                                    return BorderSide(color: Colors.purple, width: 1,);
                                  }),
                                ),
                              ),
                            ],
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
  }
}
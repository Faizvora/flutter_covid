import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'set_vars.dart';

class VaccineScreen extends StatefulWidget {
  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {

  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0,);
  List details;
  var searchController = TextEditingController();
  List<String> userList = [];
  bool isSearching = false;
  
  Future<void> loadData() async {
    details = await setDetails('/vaccine_test/');
    print('details');
    userList.clear();
    for (int i = 0; i < details.length; i++) {
      userList.add(await getFirstnameLastname(details[i]['user_name']));
    }
    print(userList);
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
                // actions: [
                //   isSearching
                //   ? IconButton(
                //     icon: Icon(Icons.cancel),
                //     onPressed: () {
                //       setState(() {
                //         this.isSearching = false;
                //       });
                //     },
                //   )
                //   : IconButton(
                //     icon: Icon(Icons.search),
                //     onPressed: () {
                //       setState(() {
                //         this.isSearching = true;
                //       });
                //     },
                //   ),
                //   IconButton(
                //     icon: Icon(Icons.auto_awesome),
                //     onPressed: () {
                //
                //     },
                //   )
                // ],
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
                                  );
                                } else {
                                  return SpinKitCubeGrid(color: Colors.white, size: 50.0,);
                                }
                              },
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
              title: Text('Vaccine details'),
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
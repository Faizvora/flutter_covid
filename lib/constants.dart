import 'package:flutter/material.dart';
import 'set_vars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class KSpinkit extends StatelessWidget {

  final String title;
  KSpinkit({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(this.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: Center(child: SpinKitCubeGrid(color: Colors.white, size: 50.0,),),
      ),
    );
  }
}

class ReusableEntryfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class VaccineScreen extends StatefulWidget {

  final String title;
  VaccineScreen({this.title});
  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {

  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0,);
  List details;
  // final MaterialStateProperty<Color> bgColor = Color();
  
  Future<void> loadData() async {
    details = await setDetails('/vaccine_test/');
    print(details);
  }
  
  String getDose(int cDose) {
    if (cDose == 1) return '1';
    else if (cDose == 2) return '2';
    else if (cDose == 3) return '3';
    else return '0';
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
              title: Text('${widget.title} details'),
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
              child: Center(child: spinkit,),
            ),
          );
        }
      },
    );
  }
}

// class ReusableText extends StatelessWidget {

//   final String username;
//   ReusableText({this.username});
//   String name;
//   String result;

//   void setNameResult() async {
//     name = await getFirstnameLastname(this.username);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(username);
//   }
// }
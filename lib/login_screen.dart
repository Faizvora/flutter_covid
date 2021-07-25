import 'package:covid_tracker/set_vars.dart';
import 'package:flutter/material.dart';
import 'get_from_server.dart';
// import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = true;
  get crossAxisAlignment => null;
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  var usere = false;

  final enterUsernameSB = SnackBar(content: Text('Enter valid username or email!'), backgroundColor: Colors.grey);
  final enterPasswordSB = SnackBar(content: Text('Enter valid password!'), backgroundColor: Colors.grey);
  final usernameNESB = SnackBar(content: Text('Username not Exists'), backgroundColor: Colors.grey);
  final wrongPasswordSB = SnackBar(content: Text('Wrong Password'), backgroundColor: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purple, Colors.indigo]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Hero(
                          tag: 'logo',
                          child: Icon(
                            Icons.account_box_rounded,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                        child: Column(children: <Widget>[
                          TextField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email, color: Colors.purple),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Column(children: <Widget>[
                          TextField(
                            obscureText: status,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock, color: Colors.purple),
                              suffixIcon:IconButton(
                                  color: Colors.purple,
                                  icon: status?Icon(Icons.visibility_off):Icon(Icons.visibility),
                                  onPressed: (){
                                    setState(() {
                                      status = !status;
                                    });
                                  }
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: ButtonTheme(
                            minWidth: 100,
                            height: 40,

                            child: RaisedButton(
                                onPressed: () async {
                                  print('login');
                                  //Disable Login Button
                                  usere = false;
                                  if (userController.text == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(enterUsernameSB);
                                  }
                                  if (passwordController.text == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(enterPasswordSB);
                                  }
                                  if (userController.text != '' && passwordController.text != '') {
                                    var body = await getData("/users_tbl/");
                                    print('body');


                                    //user login
                                    for (int i = 0; i < body['results'].length; i++) {
                                      if (body['results'][i]['email_id'] == userController.text) {
                                        usere = true;
                                        if (body['results'][i]['password'] == passwordController.text) {
                                          String username = body['results'][i]['username'];
                                          List rcptrDetails = await getTestDetailsByUser(username, '/rcptr_test/');
                                          List vaccineDetails = await getTestDetailsByUser(username, '/vaccine_test/');
                                          print(username);
                                          print(rcptrDetails);
                                          print(vaccineDetails);
                                          Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                                            'username': username,
                                            'rcptr': rcptrDetails,
                                            'vaccine': vaccineDetails,
                                          });

                                        }

                                        else{
                                        // ScaffoldMessenger.of(context).showSnackBar(enterPasswordSB);
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible: true, // user must tap button!
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child:SizedBox(
                                                  height: 150,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        borderRadius: BorderRadius.circular(10),
                                                        gradient: LinearGradient(
                                                          colors: [Colors.purple, Colors.indigo],
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                        )
                                                    ),
                                                    height: 50,
                                                    width: 50,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('Error !!',
                                                          style:TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 22,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                        Text('Invalid Credentials',
                                                          style:TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }
                                    }
                                    //     if (body['results'][i]['password'] == passwordController.text) {
                                    //       FetchData fetchData1 = FetchData();
                                    //       var body1 = await fetchData1.get_appointments();
                                    //       List futureList=[];
                                    //       List pastList=[];
                                    //       final DateTime now = DateTime.now();
                                    //       final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                    //       String formatted = formatter.format(now);
                                    //       print(formatted);
                                    //       List result = body1['results'];
                                    //       for(var i=0; i<result.length; i++){
                                    //         if(result[i]['username'] == usern){
                                    //           DateTime temp = DateTime.tryParse(result[i]['appointment_date_time']);
                                    //           if(temp.compareTo(now)>0){
                                    //             futureList.add(result[i]);
                                    //           }
                                    //           else{
                                    //             pastList.add(result[i]);
                                    //           }
                                    //         }
                                    //         print(result[i]['username']);
                                    //       }
                                    //       print("FL");
                                    //       print(futureList);
                                    //       print("PL");
                                    //       print(pastList);
                                    //       Navigator.pushReplacementNamed(context,'/welcome',arguments:{'username':usern,'futureList':futureList,'pastList':pastList});
                                    //     } else {
                                    //       ScaffoldMessenger.of(context)
                                    //           .showSnackBar(wrongPasswordSB);
                                    //     }
                                    //   }
                                    // }

                                    //admin login
                                    if (usere == false) {
                                      var adminBody = await getData("/admin_tbl/");
                                      print('admin login');
                                      print(adminBody);
                                      for (int i = 0; i < adminBody['results'].length; i++) {
                                        if (adminBody['results'][i]['admin_user'] == userController.text) {
                                          usere = true;
                                          if (adminBody['results'][i]['admin_pass'] == passwordController.text) {
                                            Navigator.pushReplacementNamed(context,'/dashboard');
                                          }
                                          else{
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible: true, // user must tap button!
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  child:SizedBox(
                                                    height: 150,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.rectangle,
                                                          borderRadius: BorderRadius.circular(10),
                                                          gradient: LinearGradient(
                                                            colors: [Colors.purple, Colors.indigo],
                                                            begin: Alignment.topRight,
                                                            end: Alignment.bottomLeft,
                                                          )
                                                      ),
                                                      height: 50,
                                                      width: 50,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text('Error !!',
                                                            style:TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 22,
                                                                color: Colors.white
                                                            ),
                                                          ),
                                                          Text('Invalid Credentials',
                                                            style:TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.white
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }


                                      }
                                    }

                                    // if (usere == false) {
                                    //   // ScaffoldMessenger.of(context).showSnackBar(usernameNESB);
                                    //   showDialog<void>(
                                    //     context: context,
                                    //     barrierDismissible: false, // user must tap button!
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         title: Text('Error !!'),
                                    //         content: SingleChildScrollView(
                                    //           child: ListBody(
                                    //             children: <Widget>[
                                    //               Text('Username not found'),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //         actions: <Widget>[
                                    //           TextButton(
                                    //             child: Text('OK'),
                                    //             onPressed: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //           ),
                                    //         ],
                                    //       );
                                    //     },
                                    //   );
                                    // }
                                  }
                                },
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),),
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          )),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Center(
                          child: GestureDetector(
                              child: Text("Forgot Password?",
                                  style: TextStyle(color: Colors.white, fontSize: 16)),
                              onTap: () {
                                Navigator.pushNamed(context, '/forgot');
                              })),
                    ),
                    Center(
                          child: Text("OR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: ButtonTheme(
                            minWidth: 140,
                            height: 42,
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signUp');
                                },
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("Create New Account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          )),
                    ),
                  ],
                ),

            )

    );
  }
}
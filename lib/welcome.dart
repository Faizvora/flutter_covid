// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'dart:io';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'set_vars.dart';
// import 'package:intl/intl.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  String username;
  bool rcptrBtnState = true;
  bool vaccineBtnState = true;
  bool vaccinePos = false;
  bool vaccineNeg = false;
  bool rcptrCounterColor = false;
  bool vaccineCounterColor = false;
  Future<void> loadData() async {
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    username = data['username'];

    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text('$username'),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.indigo],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 15.0),
                      child: Text('RC-PTR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                        child: Padding(
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
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SlideCountdownClock(
                                      duration: Duration(seconds: 6),
                                      slideDirection: SlideDirection.Down,
                                      separator: ':',
                                      textStyle: TextStyle(
                                        fontSize: 20.0,
                                        color: rcptrCounterColor ? Colors.red : Colors.green,
                                        fontWeight: FontWeight.bold
                                      ),
                                      shouldShowDays: true,
                                      onDone: () {
                                        setState(() {
                                          rcptrCounterColor = true;
                                          rcptrBtnState = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        )
                      ),
                    ),
                    Offstage(
                      offstage: rcptrBtnState,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text('update RC-PTR Test.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  //todo 
                                  OutlinedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.green,
                                            title: Text('Are you sure?'),
                                            content: Text('You are NEGATIVE', style: TextStyle(fontSize: 25),),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No', style: TextStyle(color: Colors.black),),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacementNamed(context, '/welcome', arguments: {
                                                    'username': username,
                                                  });
                                                },
                                                child: Text('Yes', style: TextStyle(color: Colors.black),),
                                              ),
                                            ],
                                          );
                                        });
                                    },
                                    child: Text('NEGATIVE', style: TextStyle(color: Colors.black),),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.red,
                                            title: Text('Are you sure?'),
                                            content: Text('You are POSITIVE', style: TextStyle(fontSize: 25),),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No', style: TextStyle(color: Colors.black),),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes', style: TextStyle(color: Colors.black),),
                                              ),
                                            ],
                                          );
                                        });
                                    },
                                    child: Text('POSITIVE', style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 15.0),
                      child: Text('Vaccine',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                        child: Padding(
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
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SlideCountdownClock(
                                        duration: Duration(seconds: 10),
                                        slideDirection: SlideDirection.Down,
                                        shouldShowDays: true,
                                        separator: ':',
                                        textStyle: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: vaccineCounterColor ? Colors.red : Colors.green,
                                        ),
                                        onDone: () {
                                          setState(() {
                                            vaccineCounterColor = true;
                                            vaccineBtnState = false;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: vaccineBtnState,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text('upload Vaccine Report.',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  //todo 
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor: vaccineNeg ?
                                        MaterialStateProperty.resolveWith((states){
                                          return Color(0xff00ff00);
                                        }) :
                                        null
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.green,
                                            title: Text('Are you sure?'),
                                            content: Text('You are NEGATIVE', style: TextStyle(fontSize: 25),),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No', style: TextStyle(color: Colors.black),),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    vaccinePos = false;
                                                    vaccineNeg = true;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes', style: TextStyle(color: Colors.black),),
                                              ),
                                            ],
                                          );
                                        });
                                    },
                                    child: Text('NEGATIVE', style: TextStyle(color: Colors.black),),
                                  ),
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor: vaccinePos ?
                                        MaterialStateProperty.resolveWith((states){
                                          return Color(0xffff0000);
                                        }) :
                                        null
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.red,
                                            title: Text('Are you sure?'),
                                            content: Text('You are POSITIVE', style: TextStyle(fontSize: 25),),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No', style: TextStyle(color: Colors.black),),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    vaccinePos = true;
                                                    vaccineNeg = false;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes', style: TextStyle(color: Colors.black),),
                                              ),
                                            ],
                                          );
                                        });
                                    },
                                    child: Text('POSITIVE', style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text('UPLOAD REPORT', style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'get_from_server.dart';

class SignUpscreen extends StatefulWidget {
  @override
  _SignUpscreen createState() => _SignUpscreen();
}

class _SignUpscreen extends State<SignUpscreen> {
  final TextEditingController f_name = TextEditingController();
  final TextEditingController l_name = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email_id = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cnf_password = TextEditingController();
  final TextEditingController mobile_no = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 12),
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: f_name,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.keyboard,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your First Name',
                        hintStyle: TextStyle(
                          // backgroundColor: Colors.white,
                          color: Colors.grey,
                          decorationColor: Colors.black,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: l_name,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.keyboard,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your Last Name',
                        hintStyle: TextStyle(
                          // backgroundColor: Colors.white,
                          color: Colors.grey,
                          decorationColor: Colors.black,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: username,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your Username',
                        hintStyle: TextStyle(
                          // backgroundColor: Colors.white,
                          color: Colors.grey,
                          decorationColor: Colors.black,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: email_id,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your Email Id',
                        hintStyle: TextStyle(color: Colors.grey),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: password,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: cnf_password,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: mobile_no,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        hintText: 'Mobile No',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        // labelText: 'Enter your email',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyanAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ButtonTheme(
                    minWidth: width,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      elevation: 10,
                      onPressed: () async {
                        FetchData fetch = FetchData();
                        var result = await fetch.postUser(
                            f_name.text,
                            l_name.text,
                            username.text,
                            email_id.text,
                            password.text,
                            cnf_password.text,
                            mobile_no.text);
                        if (result.statusCode == 201 ||
                            result.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("User Registered Please login."),
                              backgroundColor: Colors.grey,
                            ),
                          );
                          Navigator.of(context).pop();
                        } else {
                          if (result.body.contains('username')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    jsonDecode(result.body)['username'][0]
                                        .substring(19)),
                                backgroundColor: Colors.grey,
                              ),
                            );
                          }
                          if (result.body.contains('email')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    jsonDecode(result.body)['email_id'][0]),
                                backgroundColor: Colors.grey,
                              ),
                            );
                          }
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(result.body),
                          //     backgroundColor: Colors.grey,
                          //   ),
                          // );
                          // for (int i = 0; i < jsn.length; i++){
                          //
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(jsnDecode[]),
                          //       backgroundColor: Colors.grey,
                          //     ),
                          //   );
                          // }
                        }

                        // Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

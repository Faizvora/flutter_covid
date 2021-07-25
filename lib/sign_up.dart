import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'get_from_server.dart';

class SignUpscreen extends StatefulWidget {
  @override
  _SignUpscreen createState() => _SignUpscreen();
}

class _SignUpscreen extends State<SignUpscreen> {

  bool checkState = false;
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cnfPassword = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();

  SnackBar passwordNM = SnackBar(content: Text("Passwords don't match!"), backgroundColor: Colors.grey,);
  SnackBar pleasePVC = SnackBar(content: Text("Please provide valid credentials!"), backgroundColor: Colors.grey,);
  SnackBar userRegPL = SnackBar(content: Text("User registration successful, Please Login"), backgroundColor: Colors.grey,);
  SnackBar checkCred = SnackBar(content: Text("Please check Username and Email."), backgroundColor: Colors.grey,);

  bool status = true;
  bool status2 = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
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
                  height: 140,
                  child: Hero(
                    tag: 'logo',
                    child: Icon(
                      Icons.account_box_rounded,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: fName,
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
                        hintText: 'First Name',
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
                      controller: lName,
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
                        hintText: 'Last Name',
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
                        hintText: 'Username',
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
                      controller: emailId,
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
                        hintText: 'Email Id',
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
                      obscureText: status,
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
                        suffixIcon:IconButton(
                            color: Colors.purple,
                            icon: status?Icon(Icons.visibility_off):Icon(Icons.visibility),
                            onPressed: (){
                              setState(() {
                                status = !status;
                              });
                            }
                        ),
                        hintText: 'Password',
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
                      obscureText: status2,
                      controller: cnfPassword,
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
                        suffixIcon:IconButton(
                            color: Colors.purple,
                            icon: status2?Icon(Icons.visibility_off):Icon(Icons.visibility),
                            onPressed: (){
                              setState(() {
                                status2 = !status2;
                              });
                            }
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
                      controller: mobileNo,
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
                Padding(
                  padding: const EdgeInsets.only(left: 1.0,right: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(value: checkState,
                         activeColor: Colors.purple,
                          onChanged: (value){
                              setState(() {
                                checkState = !checkState;
                              });
                              print(checkState);
                          }),
                      Text(
                        'I agree to ',
                        style: TextStyle(color: Colors.white,
                          fontSize: 12.0
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Terms & Conditions'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('This is a demo Terms & Conditions.'),
                                      Text('Would you like to approve of this message?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Approve'),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: Text('Decline'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },

                        child: Text(
                          'Terms of Services',
                          style: TextStyle(color: Colors.white,
                            decoration: TextDecoration.underline,
                              fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        ' and ',
                        style: TextStyle(color: Colors.white,
                            fontSize: 12.0
                        ),
                      ),
                       GestureDetector(
                         onTap: (){
                           showDialog<void>(
                             context: context,
                             barrierDismissible: false, // user must tap button!
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text('Privacy Policies'),
                                 content: SingleChildScrollView(
                                   child: ListBody(
                                     children: <Widget>[
                                       Text('This is a demo Privacy Policies'),
                                       Text('Would you like to approve of this message?'),
                                     ],
                                   ),
                                 ),
                                 actions: <Widget>[
                                   TextButton(
                                     child: Text('Approve'),
                                     onPressed: () {},
                                   ),
                                   TextButton(
                                     child: Text('Decline'),
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                   ),
                                 ],
                               );
                             },
                           );
                         },
                         child: Text(
                            'Privacy Policy',
                            style: TextStyle(color: Colors.white,
                              decoration: TextDecoration.underline,
                                fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(4,4,4,12.0),
                  child: ButtonTheme(
                    minWidth: width/1.1,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      elevation: 10,
                      onPressed: () async {
                        //Disable Button
                        if (password.text == '' || fName.text == '' || lName.text == '' || username.text == '' || cnfPassword.text == '' || emailId.text == '' || mobileNo.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(pleasePVC);

                          //Enable Button
                        } else if (password.text == cnfPassword.text){
                          bool success;
                          success = await postUser(fName.text, lName.text, username.text, emailId.text, password.text, mobileNo.text);
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(userRegPL);
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(checkCred);
                            //Enable Button
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(passwordNM);
                          //Enable Button

                        }
                        // FetchData fetch = FetchData();
                        // var result = await fetch.postUser(
                        //     f_name.text,
                        //     l_name.text,
                        //     username.text,
                        //     email_id.text,
                        //     password.text,
                        //     cnf_password.text,
                        //     mobile_no.text);
                        // if (result.statusCode == 201 ||
                        //     result.statusCode == 200) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("User Registered Please login."),
                        //       backgroundColor: Colors.grey,
                        //     ),
                        //   );
                        //   Navigator.of(context).pop();
                        // } else {
                        //   if (result.body.contains('username')) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: Text(
                        //             jsonDecode(result.body)['username'][0]
                        //                 .substring(19)),
                        //         backgroundColor: Colors.grey,
                        //       ),
                        //     );
                        //   }
                        //   if (result.body.contains('email')) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: Text(
                        //             jsonDecode(result.body)['email_id'][0]),
                        //         backgroundColor: Colors.grey,
                        //       ),
                        //     );
                        //   }
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
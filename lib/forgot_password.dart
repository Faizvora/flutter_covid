import 'package:covid_tracker/get_from_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool success;
  var emailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple, Colors.indigo]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 115, 0, 0),
                      child: Text(
                        'Forgot',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 175, 0, 0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(0, 168, 0, 0),
                    //   child: Text(
                    //     '.',
                    //     style: TextStyle(
                    //       fontSize: 50,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: emailText,
                      cursorColor: Colors.white,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ButtonTheme(
                          height: 40,
                          minWidth: 200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: RaisedButton(
                            onPressed: () async {
                              print('clicked');
                              var data = await getData("/users_tbl/");
                              List users = data['results'];
                              // print(users);
                              for (var i = 0; i < users.length; i++) {
                                if (users[i]['email_id'] == emailText.text) {
                                  print("Email found");
                                  String username = 'sameensolkar100@gmail.com';
                                  String password = '123Sameen@';

                                  String userPassword = users[i]['password'];
                                  final smtpServer = gmail(username, password);
                                  // Use the SmtpServer class to configure an SMTP server:
                                  // final smtpServer = SmtpServer('smtp.domain.com');
                                  // See the named arguments of SmtpServer for further configuration
                                  // options.

                                  // Create our message.
                                  final message = Message()
                                    ..from = Address(username, 'Sam2')
                                    ..recipients.add('${emailText.text}')
                                    ..subject =
                                        'User Password ${DateTime.now()}'
                                    ..html =
                                        "<h1>Your Password</h1>\n<p>Password ${userPassword}</p>";

                                  try {
                                    final sendReport =
                                        await send(message, smtpServer);
                                    print('Message sent: ' +
                                        sendReport.toString());
                                  } on MailerException catch (e) {
                                    print('Message not sent.');
                                    for (var p in e.problems) {
                                      print('Problem: ${p.code}: ${p.msg}');
                                    }
                                  }
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        true, // user must tap button!
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: SizedBox(
                                          height: 150,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.purple,
                                                    Colors.indigo
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                )),
                                            height: 50,
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Password Sent',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Please check your mail.',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  // var connection = PersistentConnection(smtpServer);
                                  // // Send the first message
                                  // await connection.send(message);
                                  //
                                  // // close the connection
                                  // await connection.close();

                                  return;
                                }
                              }
                              print("Email doesnt exit");
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    true, // user must tap button!
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      height: 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.purple,
                                                Colors.indigo
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            )),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            'Email not found !!',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                              // Navigator.pushNamed(context, '/');
                            },
                            color: Colors.white,
                            child: Text(
                              'GET PASSWORD',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

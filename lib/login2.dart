import 'package:covid_vaccine/welcome_screen-1.dart';
import 'package:flutter/material.dart';
import 'get_from_server.dart';
import 'dashboard.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool status = true;
  get crossAxisAlignment => null;
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  final enter_username_sb = SnackBar(
    content: Text('Enter valid username or email!'),
    backgroundColor: Colors.grey,
  );
  final enter_password_sb = SnackBar(
    content: Text('Enter valid password!'),
    backgroundColor: Colors.grey,
  );
  final username_ne_sb = SnackBar(
    content: Text('Username not Exists'),
    backgroundColor: Colors.grey,
  );
  final wrong_password_sb = SnackBar(
    content: Text('Wrong Password'),
    backgroundColor: Colors.grey,
  );

  var usere = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.purple,
                            Colors.indigo,
                          ]),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(height: 150),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Column(children: <Widget>[
                          TextField(
                              controller: userController,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email, color: Colors.purple),
                              ))
                        ]),
                      ),
                      SizedBox(height: 10),
                      Container(
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
                      SizedBox(height: 20),
                      Center(
                          child: RaisedButton(
                              onPressed: () async {
                                usere = false;
                                if (userController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(enter_username_sb);
                                }
                                if (passwordController.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(enter_password_sb);
                                }
                                if (userController.text != '' &&
                                    passwordController.text != '') {
                                  FetchData fetchData = FetchData();
                                  var body = await fetchData.getUser('');
                                  for (int i = 0; i < body['results'].length; i++) {
                                    if (body['results'][i]['email_id'] ==
                                        userController.text ||
                                        body['results'][i]['username'] ==
                                            userController.text) {
                                      usere = true;
                                      print(body['results'][i]['username']);
                                      var usern = body['results'][i]['username'];
                                      if (body['results'][i]['password'] ==
                                          passwordController.text) {
                                        // Navigator.pushNamed(context, '/welcome');
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeScreen(username: usern)),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(wrong_password_sb);
                                      }
                                    }
                                  }

                                  if (usere == false) {
                                    var adminBody = await fetchData.getAdminUser();
                                    for (int i = 0;
                                    i < adminBody['results'].length;
                                    i++) {
                                      if (adminBody['results'][i]['admin_user'
                                          ''] ==
                                          userController.text) {
                                        usere = true;
                                        var usern =
                                        adminBody['results'][i]['admin_user'];
                                        if (adminBody['results'][i]['admin_pass'] ==
                                            passwordController.text) {
                                          FetchData fetchData = FetchData();
                                          var usercount = await fetchData.get_n_users();
                                          var docscount = await fetchData.get_n_docs();
                                          var testcount = await fetchData.get_n_tests();
                                          var appointmentcount = await fetchData.get_n_appointments();

                                          Navigator.pushNamed(context,'/dashboard',arguments: {'usercount':usercount,
                                          'docscount':docscount,'testcount':testcount,'appointmentcount':appointmentcount});

                                        }
                                      }
                                    }
                                  }

                                  if (usere == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(username_ne_sb);
                                  }
                                }
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 15),
                      Center(
                          child: GestureDetector(
                              child: Text("Forgot Password?",
                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                              onTap: () {
                                Navigator.pushNamed(context, '/forgot');
                              })),
                      SizedBox(height: 30),
                      Center(
                          child: Text("OR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 30),
                      Center(
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Sign up",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 300)
                    ]))
              ],
            )));
  }
}

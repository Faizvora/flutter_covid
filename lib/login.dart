import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool status = true;
  get crossAxisAlignment => null;
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
                      //Colors.deepPurpleAccent,
                    ]),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 150),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(children: <Widget>[
                      TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email),
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
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              color: Colors.white,
                              icon: status?Icon(Icons.visibility_off):Icon(Icons.visibility),
                              onPressed: (){
                                setState(() {
                                  status = !status;
                                });
                              }
                          ),
                        ),
                        obscureText: true,
                      )
                    ]),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/welcome');
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      child: Text("Forgot Password?",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot');
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      "OR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                            fontWeight: FontWeight.bold),),),),
                  SizedBox(height: 200)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


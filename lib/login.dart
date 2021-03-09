import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400],
                ]),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 150),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
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
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                        obscureText: true,
                      )
                    ]),
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: RaisedButton(
                          onPressed: () {
                            //todo: login
                            Navigator.pushNamed(context, '/welcome');
                          },
                          color: Colors.orange[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)))),
                  SizedBox(height: 15),
                  Center(
                      child: GestureDetector(
                          child: Text("Forgot Password?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          onTap: () {
                            //todo: forgot password
                            Navigator.pushNamed(context, '/forgot');
                          })),
                  SizedBox(height: 30),
                  Center(
                      child: Text("OR",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  SizedBox(height: 30),
                  Center(
                      child: RaisedButton(
                          onPressed: () {
                            //todo: signup
                            Navigator.pushNamed(context, '/signup');
                          },
                          color: Colors.orange[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)))),
                  SizedBox(height: 150)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

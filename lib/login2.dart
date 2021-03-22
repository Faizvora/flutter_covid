import 'package:flutter/material.dart';
import 'get_from_server.dart';

class Login extends StatelessWidget {
  get crossAxisAlignment => null;
  final userController = TextEditingController();
  final passwordController = TextEditingController();

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
                    controller: passwordController,
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
                      onPressed: () async {
                        FetchData fetchData = FetchData();
                        var body = await fetchData.getUser('');
                        print('RESPONSE');
                        print(body);
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(content: Text(body));
                            });
                        // Navigator.pushNamed(context, '/welcome');
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

import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login.dart';
import 'signup.dart';
import 'forgot_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpscreen(),
        '/forgot': (context) => ForgotPassword(),
      },
    );
  }
}

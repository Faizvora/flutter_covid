import 'package:covid_tracker/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workmanager/workmanager.dart';
import 'dashboard.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
import 'notification.dart';
import 'rcptr_details.dart';
import 'vaccine_details.dart';
import 'user_details.dart';
import 'document_details.dart';
import 'sign_up.dart';
import 'welcome_demo.dart';



void main()async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/forgot': (context) => ForgotPassword(),
        '/rcptr': (context) => RCPTRScreen(),
        '/vaccine': (context) => VaccineScreen(),
        '/userDetails': (context) => UserDetailScreen(),
        '/documentview': (context) => PdfViewPage(),
        '/docDetails': (context) => DocumentDetailScreen(),
        '/welcome': (context) => WelcomeScreenDemo(),
        '/signUp': (context) => SignUpscreen(),
        '/pdfview': (context) => PdfViewPage(),
        // '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}
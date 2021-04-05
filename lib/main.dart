import 'package:covid_vaccine/total_appointments.dart';
import 'package:covid_vaccine/total_doc.dart';
import 'package:covid_vaccine/total_tests.dart';
import 'package:covid_vaccine/total_users.dart';
import 'package:covid_vaccine/user_summary.dart';
import 'package:flutter/material.dart';
import 'appointment_details.dart';
import 'create_appointment.dart';
import 'welcome_screen-1.dart';
import 'login2.dart';
import 'signup.dart';
import 'forgot_password.dart';
import 'get_from_server.dart';
import 'dashboard.dart';

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
        '/dashboard':(context) => Dashboard(),
        '/signup': (context) => SignUpscreen(),
        '/forgot': (context) => ForgotPassword(),
        '/Appointmentdetails':(context) => AppointmentDetails(),
        '/totalusers':(context) => TotalUsers(),
        '/totaldocs':(context) => TotalDoc(),
        '/totalappointments':(context) => TotalAppointments(),
        '/totaltest':(context) =>TotalTests(),
        '/usersummary':(context) =>SummaryScreen(),
        '/createappointment':(context) =>CreateAppointment(),
      },
    );
  }
}

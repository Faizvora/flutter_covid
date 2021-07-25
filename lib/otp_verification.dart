import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'sign_up.dart';
import 'login_screen.dart';
import 'get_from_server.dart';

class OTP_Verification extends StatefulWidget {
  final String fname;
  final String lname;
  final String username;
  final String email;
  final String password;
  final String mobile;
  OTP_Verification({
    Key key,
    @required this.fname,
    this.lname,
    this.username,
    this.email,
    this.password,
    this.mobile,
  }) : super(key: key);

  @override
  _OTP_VerificationState createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  final TextEditingController otpController = TextEditingController();

  // String Controller = otpController.text;

  SnackBar invalidOTP = SnackBar(
    content: Text("Please Enter Valid OTP"),
    backgroundColor: Colors.grey,
  );
  SnackBar verifiedOTP = SnackBar(
    content: Text("User registration successful, Please Login"),
    backgroundColor: Colors.grey,
  );

  void sendOTP() async {
    EmailAuth.sessionName = "Covid Tracker App";
    var otp =
        await EmailAuth.sendOtp(receiverMail: widget.email);
    if (otp) {
      print('otp send');
    }
  }

  Future<void> verifyOTP() async {
    var otp = EmailAuth.validate(
        receiverMail: widget.email, userOTP: otpController.text);
    if (otp) {
      ScaffoldMessenger.of(context).showSnackBar(verifiedOTP);
      bool success;
      success = await postUser(widget.fname, widget.lname, widget.username,
          widget.email, widget.password, widget.mobile);
      Navigator.push(context,MaterialPageRoute(builder:(context)=> LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(invalidOTP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    child: TextFormField(
                      controller: otpController,
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
                        hintText: 'Enter OTP',
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
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
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
                // Text(widget.email),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ButtonTheme(
                    // minWidth: MediaQuery.of(context).size.width,
                    // minWidth: width,
                    height: 50,
                    child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        elevation: 10,
                        onPressed: () {
                          verifyOTP();
                        }
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

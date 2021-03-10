import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body:Center(
        child:Container(
          decoration: BoxDecoration(
           gradient: LinearGradient(
           begin: Alignment.topRight,
           end: Alignment.bottomLeft,
           colors: [Colors.purple,Colors.indigo]
          ),
         ),



        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

          Container(

            child: Stack(


              children: <Widget>[


                Container(
                  padding: EdgeInsets.fromLTRB(15, 115, 0, 0),
                  child: Text(
                    'Forgot' ,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 175, 0, 0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(190, 168, 0, 0),
                  child: Text(
                    '.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                  ),
                ),



              ],

            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35,left: 20,right: 20),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email or Username',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,

                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 60),
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.white,
                    color: Colors.white,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){},
                      child: Center(
                        child: Text('GET PASSWORD',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,


                          ),
                        ),
                      ),

                    ),
                  ),
                ),

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

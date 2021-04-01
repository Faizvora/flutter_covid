import 'package:flutter/material.dart';
import 'get_from_server.dart';

class CreateAppointment extends StatefulWidget {
  @override
  _CreateAppointmentState createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  DateTime pickedDateA;
  TimeOfDay timeA;
  DateTime pickedDateC;
  TimeOfDay timeC;
   // ye variable hai create by ka

  @override
  void initState(){
    super.initState();
    pickedDateA = DateTime.now();
    timeA = TimeOfDay.now();
    pickedDateC = DateTime.now();
    timeC = TimeOfDay.now();
  }

  String valueChoose;
  String valueChoose1;
  String valueChoose2;
  List ListItem = [];
  List ListItem1 = [];
  String username ;

  @override
  Widget build(BuildContext context) {
    Map data =  ModalRoute.of(context).settings.arguments;
    ListItem = data['userlist'];
    ListItem1 = data['appList'];
    username = data['username'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Create Appointment"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color> [Colors.purple,Colors.indigo],
                begin: Alignment.topRight,
                end:Alignment.bottomLeft,
              )
          ),
          child: Column(
            children:<Widget> [

              // SizedBox(
              //   height:50,
              // ),

              // ),

              //username:

              Padding(
                padding: const EdgeInsets.only(top: 12.0 , left: 16.0 ,bottom: 1.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child:Text('Username :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16 ,),
                child: Container(
                  padding: EdgeInsets.only(left:16,right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select User',
                      style: TextStyle(color: Colors.black),),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    // style: TextStyle(
                    //
                    // ),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose=newValue;
                        print(valueChoose);
                      });
                    },
                    items: ListItem.map((valueItem){
                      return DropdownMenuItem(
                        value:valueItem,
                        child: Text(valueItem),);
                    }
                    ).toList(),
                  ),
                ), ),

              // SizedBox(
              //   height:10,
              // ),


              //Appointment Date Time

              Padding(
                padding: const EdgeInsets.only(top: 8.0 , left: 16.0, bottom: 6.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child:Text('Appointment date time :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                child: Container(
                  child: ListTile(
                    title: Text("Date: ${pickedDateA.year}, ${pickedDateA.month}, ${pickedDateA.day}",style: TextStyle(color: Colors.white,)),
                    trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    leading: Icon(Icons.calendar_today,color: Colors.white,),
                    onTap: _pickDate,
                  ),
                ),
              ),

              // SizedBox(
              //   height:10,
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                child: Container(
                  child: ListTile(
                    title: Text("Time: ${timeA.hour} : ${timeA.minute}",style: TextStyle(color: Colors.white,)),
                    trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    leading: Icon(Icons.timeline,color: Colors.white,),
                    onTap: _pickTime,
                  ),
                ),
              ),

              // SizedBox(
              //   height:10,
              // ),


              //Appointment Type

              Padding(
                padding: const EdgeInsets.only(top: 8.0 , left: 16.0,bottom: 6.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child:Text('Appointment Type :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12,horizontal: 16),
                child: Container(
                  padding: EdgeInsets.only(left:16,right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Appointment Type',
                      style: TextStyle(color: Colors.black),),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    // style: TextStyle(
                    //
                    // ),
                    value: valueChoose1,
                    onChanged: (newValue1) {
                      setState(() {
                        valueChoose1=newValue1;
                        print(valueChoose1);
                      });
                    },
                    items: ListItem1.map((valueItem1){
                      return DropdownMenuItem(
                        value:valueItem1,
                        child: Text(valueItem1),);
                    }
                    ).toList(),
                  ),
                ),
              ),


              //Created Date:

              Padding(
                padding: const EdgeInsets.only(top: 8.0 , left: 16.0,bottom: 6.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child:Text('Created date :',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                child: Container(
                  child: ListTile(
                    title: Text("Date: ${pickedDateC.year}, ${pickedDateC.month}, ${pickedDateC.day}",style: TextStyle(color: Colors.white,)),
                    trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    leading: Icon(Icons.calendar_today,color: Colors.white,),
                    onTap: _pickDate1,
                  ),
                ),
              ),

              // SizedBox(
              //   height:10,
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                child: Container(
                  child: ListTile(
                    title: Text("Time: ${timeC.hour} : ${timeC.minute}",style: TextStyle(color: Colors.white,),),
                    trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    leading: Icon(Icons.timeline,color: Colors.white,),
                    onTap: _pickTime1,
                  ),
                ),
              ),


              // Created By:

              Padding(
                padding: const EdgeInsets.only(top: 8.0 , left: 16.0 ,bottom: 6.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child:Text('Created by : $username', // ye variable uppr hai
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),



// Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((20),),),),
                      onPressed: () async{
                        FetchData fetch = FetchData();
                        var result = await fetch.postAppointment(valueChoose, valueChoose1, pickedDateC.toString(), timeC.toString(), username);
                        if (result.statusCode == 201 ||
                            result.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("User Registered Please login."),
                              backgroundColor: Colors.grey,
                            ),
                          );

                        }
                        else print( 'failed' + result.statusCode.toString());

                      },
                      child: const Text('Make an Appointment', style: TextStyle(fontSize: 20)),
                      color: Colors.white,
                      textColor: Colors.black,
                      elevation: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);

  }

  //Appointment Date time

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
      initialDate: pickedDateA,
    );

    if (date != null)
      setState(() {
        pickedDateA = date;
        print(pickedDateA);
      });
  }
  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: timeA,
    );

    if (t != null)
      setState(() {
        timeA = t;
      });
  }

//Created Date time

  _pickDate1() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
      initialDate: pickedDateC,
    );

    if (date != null)
      setState(() {
        pickedDateC = date;
        print(pickedDateC);
      });
  }
  _pickTime1() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: timeC,
    );

    if (t != null)
      setState(() {
        timeC = t;
        print(timeC);
      });
  }

}

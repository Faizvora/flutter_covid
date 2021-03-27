import 'package:flutter/material.dart';

class TotalUsers extends StatefulWidget {
  @override
  _TotalUsersState createState() => _TotalUsersState();
}

class _TotalUsersState extends State<TotalUsers> {
  List username =<String>[
    'Gordan','Barney','Tom','Mark','Peter','Shaun','Tim','Jerry',
    'Rahul','Kiran','Morgan','Steve','Obama','Donald','Faiz','Arfat',
    'Akhram','Yakub','Sameen'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Total Users"
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple,Colors.indigo],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right:8.0,top:12.0),
          child: ListView.builder(
              itemCount: username.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Card(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(username[index],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

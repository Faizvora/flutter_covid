import 'package:flutter/material.dart';

class TotalDoc extends StatefulWidget {
  @override
  _TotalDocState createState() => _TotalDocState();
}

class _TotalDocState extends State<TotalDoc> {
   List documents =<String>[
      'Doc1','Doc2','Doc3','Doc4','Doc5','Doc6','Doc7','Doc8',
      'Doc9','Doc10'
    ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
              "Total Documents"
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
            padding: const EdgeInsets.only(left:8.0,right:8.0,top:15.0),
            child: ListView.builder(
                itemCount: documents.length,
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
                          child: Text(documents[index],
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

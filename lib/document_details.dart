import 'dart:io';
import 'package:covid_tracker/get_from_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'set_vars.dart';


class DocumentDetailScreen extends StatefulWidget {
  @override
  _DocumentDetailScreenState createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {

  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0,);
  List details;
  var searchController = TextEditingController();
  List<String> userList = [];
  bool isSearching = false;

  bool _clicked = false;

  Future<void> loadData() async {
    details = await setDetails('/vaccine_test/');
    // print(details);
  }

  Future<File> getdoc(String url)async{
    try{
      var data = await get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();


      if(url.endsWith("pdf")){
        File pdffile = File("${dir.path}/dummy.pdf");
        File urlfile = await pdffile.writeAsBytes(bytes);
        return urlfile;
      }

      else if(url.endsWith("jpg")){
        File imgfile = File("${dir.path}/dummy.jpg");
        File urlfile = await imgfile.writeAsBytes(bytes);
        return urlfile;
      }

    }
    catch(e){
      throw Exception("Error opening file");
    }
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: !isSearching
                  ? Text('Document details')
                  : TextField(
                cursorColor: Colors.white,
                controller: searchController,
                onSubmitted: (String text){
                  setState(() {
                    if (userList.contains(searchController.text)){
                      userList.clear();
                      userList.add(searchController.text);
                    }
                  });
                },
              ),

            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.indigo],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            //
                            child: FutureBuilder(
                              future: getFirstnameLastname(details[index]['user_name']),
                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                if (snapshot.connectionState == ConnectionState.done){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text("${details[index]['dose'] == '0' ? 'NO' : details[index]['dose']} DOSE",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: details[index]['dose'] == '0' ? Colors.red : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Update Date: ${details[index]['upload_date_time'].toString().substring(0, 10)}",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // ElevatedButton(
                                          //   onPressed: () {},
                                          //   child: Text('VIEW DOCUMENT'),
                                          //   style: ButtonStyle(
                                          //     backgroundColor: MaterialStateProperty<Color>?(Colors.purple),
                                          //   ),
                                          // )
                                          details[index]['dose'] == '0' ?
                                          Container(height: 40,) :
                                          OutlinedButton(
                                            onPressed:()async{
                                              String docPath;
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible: false, // user must tap button!
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child:SizedBox(
                                                      height: 100,
                                                      child: Container(
                                                        decoration: BoxDecoration(

                                                            gradient: LinearGradient(
                                                              colors: [Colors.purple, Colors.indigo],
                                                              begin: Alignment.topRight,
                                                              end: Alignment.bottomLeft,
                                                            )
                                                        ),
                                                        height: 50,
                                                        width: 50,
                                                        child: SpinKitPouringHourglass(
                                                          color: Colors.white,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                              await getdoc(details[index]["report_file"]).then((f) => docPath = f.path);
                                              Navigator.pop(context);
                                              Navigator.push(context,MaterialPageRoute(builder: (context)=>PdfViewPage(path:docPath)));
                                            },

                                            child: Text('VIEW DOCUMENT', style: TextStyle(color: Colors.purple,fontSize: 12),),
                                            style: ButtonStyle(
                                              side: MaterialStateProperty.resolveWith((states){
                                                return BorderSide(color: Colors.purple, width: 1,);
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                                else {
                                  return SpinKitPouringHourglass(
                                    color: Colors.white,
                                    size: 50.0,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('Document details'),
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.indigo],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
              ),
              child: Center(child:SpinKitPouringHourglass(
                color: Colors.white,
                size: 50.0,
              )),
            ),
          );
        }
      },
    );
  }
}

// ---- Pdf Viewer Page ------ //

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  static final int _initialPage = 1;
  int _actualPageNumber = _initialPage, _allPagesCount=1;

  @override
  Widget build(BuildContext context) {
    return widget.path.endsWith("pdf")?
    Scaffold(
        appBar: AppBar(
          actions: <Widget>[
          ],
          backgroundColor: Colors.purple,
          title: Text('Document'),
        ),
        body:
        PdfView(
          // scrollDirection: Axis.horizontal,
          documentLoader: Center(child:CircularProgressIndicator()),
          pageLoader: Center(child: CircularProgressIndicator()),
          controller:  PdfController(document: PdfDocument.openFile(widget.path),),
        )
    ):
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Document'),
      ),
      body: Container(
        child:Center(child: Image.file(new File(widget.path))),
      ),
    );

  }
}

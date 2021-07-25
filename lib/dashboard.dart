import 'package:covid_tracker/get_from_server.dart';
import 'package:flutter/material.dart';
import 'set_vars.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int user;
  int documents;

  Map<String, double> rcptrDataMap = {};

  static const spinkit = SpinKitCubeGrid(color: Colors.white, size: 50.0);

  Map<String, double> vaccineDataMap = {};

  Future<void> loadData() async {
    List countData = await setUserDoc();
    user = countData[0];
    documents = countData[1];
    List rcptrPiechartData = await setRCPTRPieChart('/rcptr_test/', 'r_result');
    double rcptrNegative = rcptrPiechartData[0].length.toDouble();
    rcptrDataMap = {
      "Red Zone": user.toDouble() - rcptrNegative,
      "Green Zone": rcptrNegative,
    };

    List vaccinePiechartData = await setVaccinePieChart('/vaccine_test/', 'dose');
    print(vaccinePiechartData);
    double noDose = vaccinePiechartData[0].length.toDouble();
    double dose1 = vaccinePiechartData[1].length.toDouble();
    double dose2 = vaccinePiechartData[2].length.toDouble();
    double dose3 = vaccinePiechartData[3].length.toDouble();
    vaccineDataMap = {
      "No Dose": noDose,
      "1st Dose": dose1,
      "2nd Dose": dose2,
      "3rd Dose": dose3,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return Scaffold(
          appBar: AppBar(
            title: Text('Dashboard'),
            backgroundColor: Colors.purple,
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Icon(Icons.logout, color: Colors.white,),
              )
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                children: [
                  // SizedBox(height: 20.0),
                  //PIE CHART ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/rcptr');
                        },
                        child: Column(
                          children: [
                            Container(
                              child: PieChart(
                                dataMap: rcptrDataMap,
                                animationDuration: Duration(milliseconds:800),
                                chartLegendSpacing: 20,
                                chartRadius: MediaQuery.of(context).size.width / 2.5,
                                colorList: [Colors.red, Colors.green],
                                initialAngleInDegree: 0,
                                chartType: ChartType.disc,
                                ringStrokeWidth: 50,
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.top,
                                  showLegends: true,
                                  legendShape: BoxShape.circle,
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: false,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                height: 50,
                                child: Card(
                                  child: Center(
                                    child: Text('RC-PTR', style: TextStyle(fontWeight: FontWeight.bold),)),
                                  // child: Image(image: AssetImage('assets/GBM.jfif')),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/docDetails');
                        },
                        child: Column(
                          children: [
                            Container(
                              child: PieChart(
                                dataMap: vaccineDataMap,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing: 20,
                                chartRadius: MediaQuery.of(context).size.width / 2.5,
                                colorList: [Colors.red, Colors.yellow, Colors.orange, Colors.green],
                                initialAngleInDegree: 0,
                                chartType: ChartType.disc,
                                ringStrokeWidth: 50,
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.top,
                                  showLegends: true,
                                  legendShape: BoxShape.circle,
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: false,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                height: 50,
                                child: Card(
                                  child: Center(child: Text('Vaccine', style: TextStyle(fontWeight: FontWeight.bold),)),
                                  // child: Image(image: AssetImage('assets/GBM.jfif')),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/userDetails');
                            },
                            child: Card(
                              margin: EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                child: Text(
                                  'USER : ' + user.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                              ),
                            )),
                        GestureDetector(
                          onTap: () async{
                            
                            var data = await getData("/vaccine_test/");

                            Navigator.pushNamed(context, '/docDetails',arguments: data);
                          },
                          child: Card(
                            margin: EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              child: Text(
                                'DOCUMENTS : ' + documents.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          },
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          icon: Icon(Icons.refresh),
                          label: Text('REFRESH'),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10,)
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Dashboard'),
              backgroundColor: Colors.purple,
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
              child: Center(
                child: SpinKitPouringHourglass(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

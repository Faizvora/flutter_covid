import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  List news = <String>[
    "The Indian Express Aarogya Setu gets CoWIN app integration: How to access Covid-19 vaccination information",
    "Fact check: No links found between vaccination and deaths",
    "Fact-check: No link between COVID-19 vaccines and those who die after receiving them",
    "Information for aged care providers, workers and residents about COVID-19 vaccines",
    "Manitobans 85 and older now eligible: The latest COVID-19 vaccine info",
    "Many trial participants still unsure about vaccine or placebo status, SII info only on request",
    "North Korea tried to obtain COVID vaccine info by hacking into Pfizer:Report",
    "Looking for COVID-19 vaccine appointments and info in Spanish? Try these websites to book at CVS, Walmart and more"
  ];
  String username = 'user1';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        backgroundColor: Colors.purple,
        title: Text('Welcome, ' + username),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  value: 'Setting',
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.purple),
                      Text('  Settings', style: TextStyle(color: Colors.black))
                    ],
                  )),
              PopupMenuItem(
                  value: 'Help',
                  child: Row(
                    children: [
                      Icon(Icons.help, color: Colors.purple),
                      Text(
                        '  Help',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
              PopupMenuItem(
                  value: 'Logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.purple),
                      Text(
                        '  Logout',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15.0),
            child: Text(
              'Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          Column(children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[400],
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [Colors.purple[100],Colors.white],
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "Yes there are now several vaccines that are in use. The first mass vaccination programme started in early December 2020 and as of and as of 15 February 2021, 175.3 million vaccine doses have been administered.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                child: Text(
                  'News',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, left: 10.0, right: 10.0),
                  child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Card(
                          elevation: 0,
                          color: Colors.purple[400],
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                news[index],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

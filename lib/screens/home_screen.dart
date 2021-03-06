// import 'package:covid19/helpers/api.dart';
// import 'package:covid19/screens/allcountry_screen.dart';
import 'package:covid19/helpers/api.dart';
import 'package:covid19/screens/allcountry_screen.dart';
import 'package:covid19/screens/info_screen.dart';
import 'package:flutter/gestures.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  List globaldata = [];
  int index;

  bool loading = true;
  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  asyncInit() async {
    var getdata = await ApiHelper().nepalSummary();
    setState(() {
      loading = false;
      this.data = getdata;
    });

    var getglobaldata = await ApiHelper().globalSummary();
    setState(() {
      loading = false;
      this.globaldata = getglobaldata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("COVID-19"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoScreen(),
                    ));
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            loading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: buildListView(),
                  ),
          ],
        ));
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: globaldata == null ? 0 : globaldata.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            color: Colors.grey[600].withOpacity(0.5),
            child: SizedBox(
              height: 545,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text("Nepal\'s Summary",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          // color: ,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["tested_positive"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Tested Positive",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["deaths"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Deaths",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Expanded(
                        child: Container(
                          // color: ,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["recovered"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Recovered",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          // color: ,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["tested_negative"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Tested Negative",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["in_isolation"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "In Isolation",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Expanded(
                        child: Container(
                          // color: ,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              data[index]["pending_result"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Pending Result",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 250.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text("Global Summary",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  globaldata == null
                      ? CircularProgressIndicator()
                      : Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(
                                    globaldata[index]['total_cases'].toString(),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                                  Text(
                                    "Total Cases",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(
                                    globaldata[index]["total_deaths"]
                                        .toString(),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                                  Text(
                                    "Total Deaths",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Expanded(
                              child: Container(
                                // color: ,
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(
                                    globaldata[index]["total_recovered"]
                                        .toString(),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                                  Text(
                                    "Total Recovered",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                  globaldata == null
                      ? SizedBox()
                      : Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // color: ,
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(
                                    globaldata[index]["new_cases"].toString(),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                                  Text(
                                    "New Cases",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(
                                    globaldata[index]["new_deaths"].toString(),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                                  Text(
                                    "New Deaths",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Expanded(
                              child: Container(
                                // color: ,
                                padding: EdgeInsets.all(20),
                                child: Column(children: <Widget>[
                                  Text(""),
                                ]),
                              ),
                            )
                          ],
                        ),
                  SizedBox(height: 15.0),
                  RichText(
                    text: TextSpan(
                      text: "For Entire Country Summary",
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Touch Here',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllCountryScreen(),
                                  ));
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

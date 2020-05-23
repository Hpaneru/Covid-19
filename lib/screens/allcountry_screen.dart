import 'package:covid19/helpers/api.dart';
import 'package:flutter/material.dart';

class AllCountryScreen extends StatefulWidget {
  @override
  _AllCountryScreenState createState() => _AllCountryScreenState();
}

class _AllCountryScreenState extends State<AllCountryScreen> {
  List data = [];
  List filteredCountries = [];
  bool isSearching = false;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  asyncInit() async {
    var data = await ApiHelper().allCountry();
    setState(() {
      loading = false;
      this.data = this.filteredCountries = data;
    });
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries = data
          .where((data) =>
              data['Country'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: !isSearching
              ? Text("WORLD SUMMARY")
              : TextField(
                  onChanged: (value) {
                    _filterCountries(value);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search Here",
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                        filteredCountries = data;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                  )
          ],
          backgroundColor: Colors.grey[900],
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
        shrinkWrap: true,
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Colors.grey[600].withOpacity(0.5),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(filteredCountries[index]["Country"],
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
                              filteredCountries[index]["TotalConfirmed"]
                                  .toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Total Confirmed",
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
                              filteredCountries[index]["TotalDeaths"]
                                  .toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                              filteredCountries[index]["TotalRecovered"]
                                  .toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "Total Recovered",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),

                  ///
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          // color: ,
                          padding: EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            Text(
                              filteredCountries[index]["NewConfirmed"]
                                  .toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "New Confirmed",
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
                              filteredCountries[index]["NewDeaths"].toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                            Text(
                              filteredCountries[index]["NewRecovered"]
                                  .toString(),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                            Text(
                              "New Recovered",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

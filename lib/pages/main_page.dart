import 'dart:convert';

import 'package:countries/pages/country.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void initState() {
    super.initState();
    homeFunction();
  }

  var Countries;
  bool flag = false;

  Future<dynamic> homeFunction() async {
    Uri url = Uri.tryParse("https://restcountries.eu/rest/v2/all");
    http.Request request = new http.Request("get", url);
    request.headers.clear();
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
    });
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var k = jsonDecode(respStr);
    setState(() {
      Countries = k;
      flag = true;
      print(Countries.length);
      print('h1');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // homeFunction();
              },
              child: ListTile(
                title: Text("Home"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: ListTile(
                title: Text("Exit"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Countries!'),
      ),
      body: flag == false
          ? Container()
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Asia",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Asia"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Europe",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Europe"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Polar",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Polar"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Americas",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Americas"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Oceania",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Oceania"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Country(
                                region: "Africa",
                                Countries: Countries,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Text("Africa"),
                      ),
                    ),
                    // for (int i=0; i < Countries.length-1; i++)
                    //   GestureDetector(
                    //     onTap: (){
                    //       print("Zeeshan Gaandu hai");
                    //     },
                    //     child: Container(
                    //       child: Text('${Countries[i]["name"]}',style: TextStyle(fontSize: 15),),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
    );
  }
}

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: ListTile(
                  title: Text("Home"),
                  trailing: Icon(Icons.home),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: ListTile(
                  title: Text("Exit"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Countries!'),
          backgroundColor: Colors.cyan,
        ),
        body: flag == false
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Asia",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Europe",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "Polar",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "Americas",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "Oceania",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "Africa",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Confirm Exit?',
                style: new TextStyle(color: Colors.black, fontSize: 20.0)),
            content: new Text(
                'Are you sure you want to exit the app? Tap \'Yes\' to exit \'No\' to cancel.'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  // this line exits the app.
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: new Text('Yes', style: new TextStyle(fontSize: 18.0)),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pop(context), // this line dismisses the dialog
                child: new Text('No', style: new TextStyle(fontSize: 18.0)),
              )
            ],
          ),
        ) ??
        false;
  }
}

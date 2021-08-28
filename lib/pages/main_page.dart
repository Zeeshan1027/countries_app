//Packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return _buildUI();
  }


  Uri url =
        Uri.tryParse("");
    http.Request request = new http.Request("get", url);
    request.headers.clear();
    request.headers.addAll({
      "content-type": "application/json; charset=utf-8",
    });
    var encode = json.encode(value);
    request.body = encode;
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var k = jsonDecode(respStr);


  Widget _buildUI() {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward),
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
    );
  }
}

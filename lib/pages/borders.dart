import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Borders extends StatefulWidget {
  final Border;
  final Countries;
  Borders({this.Border, this.Countries});
  @override
  _BordersState createState() => _BordersState();
}

class _BordersState extends State<Borders> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < widget.Border.length; i++)
              for (int j = 0; j < widget.Countries.length; j++)
                widget.Border[i] == widget.Countries[j]["cioc"]
                    ? Container(
                        child: Text("${widget.Countries[j]["name"]}"),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}

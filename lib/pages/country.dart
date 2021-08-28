import 'package:countries/pages/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Country extends StatefulWidget {
  final region;
  final Countries;
  Country({this.region, this.Countries});
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
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
            for (int i = 0; i < widget.Countries.length - 1; i++)
              Container(
                child: widget.Countries[i]["region"] == widget.region
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Borders(
                                  Border: widget.Countries[i]["borders"],
                                  Countries: widget.Countries,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: Text(
                            '${widget.Countries[i]["name"]}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    : Container(),
              ),
          ],
        ),
      ),
    );
  }
}

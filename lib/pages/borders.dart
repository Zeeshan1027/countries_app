import 'package:countries/pages/main_page.dart';
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPage();
                      },
                    ),
                  );
                },
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < widget.Border.length; i++)
                for (int j = 0; j < widget.Countries.length; j++)
                  widget.Border[i] == widget.Countries[j]["cioc"]
                      ? Container(
                          child: Text(
                            "${widget.Countries[j]["name"]}\n-------------------'",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : Container(),
            ],
          ),
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

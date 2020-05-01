import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappauth4/controller/databasehelper.dart';

class Dashboard extends StatefulWidget {
  List list;
  int index;

  Dashboard({this.index, this.list});

  @override
  DashboardState createState() => DashboardState();
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});

  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 62, left: 12.0, right: 12.0, bottom: 12.0),
              children: <Widget>[
                Container(
                  height: 50,
                  child: new Text(
                    "Name : ${list[i]['name']}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 44.0),
                ),
                Container(
                  height: 50,
                  child: new Text(
                    " Birth : ${list[i]['birth']}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 44.0),
                ),
                Container(
                  height: 50,
                  child: new Text(
                    " Place : ${list[i]['birth_place']}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class DashboardState extends State<Dashboard> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: new FutureBuilder<List>(
          future: databaseHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(list: snapshot.data)
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

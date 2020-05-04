import 'package:flutter/material.dart';

class StandMarkHomeScreen extends StatefulWidget {
  StandMarkHomeScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning that it has a State object (defined below) that contains fields that affect how it looks.

  // This class is the configuration for the state. It holds the values (in this case the title) provided by the parent (in this case the App widget) and used by the build method of the State. Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _StandMarkHomeScreenState createState() => _StandMarkHomeScreenState();
}

class _StandMarkHomeScreenState extends State<StandMarkHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, The Flutter framework has been optimized to make rerunning build methods fast, so that you can just rebuild anything that needs updating rather than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it in the middle of the parent.
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   tooltip: 'Increment',
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

import 'package:business_consultancy/stand_mark_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    final userName = Text(
      'User X',
      overflow: TextOverflow.clip,
      maxLines: 1,
      semanticsLabel: 'User Name',
      softWrap: false,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textScaleFactor: 1.25,
      textWidthBasis: TextWidthBasis.parent,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        // letterSpacing: 1.5,
        // fontStyle: FontStyle.italic,
        // fontFamily: 'Kumar One Outline',
        // decoration: TextDecoration.combine(
        //     [TextDecoration.overline, TextDecoration.underline]),
        // decorationStyle: TextDecorationStyle.double,
        // decorationThickness: 2.0,
        // decorationColor: Colors.orange,
        debugLabel: 'User Name',
        color: Colors.black,
        // backgroundColor: Colors.red,
      ),
    );

    final userCardList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      semanticChildCount: 2,
      children: <Widget>[
        StandMarkLogo.logo,
        SizedBox(height: 8.0),
        userName,
      ],
    );

    final centeredUserCardList = Center(
      child: userCardList,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Center(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll through the options in the drawer if there isn't enough vertical space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountEmail: Text(''),
            //   accountName: Text(
            //     'User X',
            //     overflow: TextOverflow.clip,
            //     maxLines: 1,
            //     semanticsLabel: 'User Name',
            //     softWrap: false,
            //     textAlign: TextAlign.center,
            //     textDirection: TextDirection.ltr,
            //     textScaleFactor: 1.5,
            //     textWidthBasis: TextWidthBasis.parent,
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       // letterSpacing: 1.5,
            //       // fontStyle: FontStyle.italic,
            //       // fontFeatures: [FontFeature.enable('smcp')],
            //       // fontFamily: 'Kumar One Outline',
            //       // decoration: TextDecoration.combine(
            //       //     [TextDecoration.overline, TextDecoration.underline]),
            //       // decorationStyle: TextDecorationStyle.double,
            //       // decorationThickness: 2.0,
            //       // decorationColor: Colors.orange,
            //       debugLabel: 'User Name',
            //       color: Colors.white,
            //       // backgroundColor: Colors.red,
            //       // background: paintButtonText,
            //     ),
            //   ),
            // ),
            DrawerHeader(
              child: centeredUserCardList,
              // decoration: ,
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Our Services'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Call StandMark Pvt. Ltd.'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                // set value
                prefs.setInt('isInitialized', 0);
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

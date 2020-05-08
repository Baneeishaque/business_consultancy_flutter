import 'package:business_consultancy/stand_mark_login_screen.dart';
import 'package:business_consultancy/stand_mark_logo.dart';
import 'package:business_consultancy/stand_mark_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userNameText = Text(
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
    debugLabel: 'User Name',
    color: Colors.black,
  ),
);

final userCardList = ListView(
  shrinkWrap: true,
  padding: EdgeInsets.all(8.0),
  semanticChildCount: 2,
  children: <Widget>[
    standMarkLogo,
    SizedBox(height: 8.0),
    userNameText,
  ],
);

final centeredUserCardList = Center(
  child: userCardList,
);

Drawer getStandMarkDrawer(BuildContext context) {
  return Drawer(
    semanticLabel: 'Navigation Drawer',
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
        //       debugLabel: 'User Name',
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        DrawerHeader(
          child: centeredUserCardList,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.rectangle,
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            //TODO : Find screen from which event triggered
          },
        ),
        ListTile(
          leading: Icon(Icons.room_service),
          title: Text('Our Services'),
          onTap: () {
            // TODO : Update the state of the app
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Text('Call StandMark Pvt. Ltd.'),
          onTap: () {
            voiceCallToStandMark();
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.portable_wifi_off),
          title: Text('My Profile'),
          onTap: () {
            // TODO : Update the state of the app
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.airline_seat_legroom_reduced),
          title: Text('Logout'),
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            // set value
            prefs.setInt('isInitialized', 0);
            Navigator.pushNamed(context, StandMarkLoginScreen.route);
          },
        ),
      ],
    ),
  );
}

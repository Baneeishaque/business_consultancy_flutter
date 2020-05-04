import 'dart:async';

import 'package:business_consultancy/stand_mark_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StandMarkLauncherScreen extends StatefulWidget {
  StandMarkLauncherScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning that it has a State object (defined below) that contains fields that affect how it looks.

  // This class is the configuration for the state. It holds the values (in this case the title) provided by the parent (in this case the App widget) and used by the build method of the State. Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _StandMarkLauncherScreenState createState() =>
      _StandMarkLauncherScreenState();
}

class _StandMarkLauncherScreenState extends State<StandMarkLauncherScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, The Flutter framework has been optimized to make rerunning build methods fast, so that you can just rebuild anything that needs updating rather than having to individually change instances of widgets.
    // TODO - Report to Dart on Timer variable Warnings

    Timer timer;

    Future<void> handleTimerCompletion() async {
      print('Timer Completed 5s');

      // if (timer.isActive) {
      //   print('Timer is Active');
      //   timer.cancel();
      // }

      final prefs = await SharedPreferences.getInstance();
      // Try reading data from the counter key. If it doesn't exist, return 0.
      final isInitialized = prefs.getInt('isInitialized') ?? 0;
      if (isInitialized == 0) {
        Navigator.pushNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/home');
      }
    }

    timer = new Timer(new Duration(seconds: 5), handleTimerCompletion);

    return Scaffold(
      body: SafeArea(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it in the middle of the parent.
          child: StandMarkLogo.logo,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:business_consultancy/stand_mark_home_screen.dart';
import 'package:business_consultancy/stand_mark_login_screen.dart';
import 'package:business_consultancy/stand_mark_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StandMarkLauncherScreen extends StatelessWidget {
  //TODO : Handle Back Button Events

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    // TODO - Report to Dart on Timer variable Warnings

    Timer timer;

    Future<void> handleTimerCompletion() async {
      print('Timer Completed 5s');

      // if (timer.isActive) {
      //   print('Timer is Active');
      //   timer.cancel();
      // }

      final prefs = await SharedPreferences.getInstance();
      // Try reading data from the isInitialized key. If it doesn't exist, return 0.
      final isInitialized = prefs.getInt('isInitialized') ?? 0;
      if (isInitialized == 0) {
        Navigator.pushNamed(context, StandMarkLoginScreen.route);
      } else {
        Navigator.pushNamed(context, StandMarkHomeScreen.route);
      }
    }

    timer = new Timer(new Duration(seconds: 5), handleTimerCompletion);

    return Scaffold(
      body: SafeArea(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it in the middle of the parent.
          child: standMarkLogo,
        ),
      ),
    );
  }
}

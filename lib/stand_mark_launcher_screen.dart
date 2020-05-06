import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:business_consultancy/stand_mark_logo.dart';

import 'package:flutter/material.dart';

class StandMarkLauncherScreen extends StatelessWidget {
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
          child: standMarkLogo,
        ),
      ),
    );
  }
}

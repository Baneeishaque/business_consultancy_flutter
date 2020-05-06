import 'package:business_consultancy/stand_mark_Services_screen.dart';
import 'package:business_consultancy/stand_mark_home_screen.dart';
import 'package:business_consultancy/stand_mark_launcher_screen.dart';
import 'package:business_consultancy/stand_mark_login_screen.dart';
import 'package:flutter/material.dart';

class StandMarkApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
        // This makes the visual density adapt to the platform that you run the app on. For desktop platforms, the controls will be smaller and closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'StandMark Pvt. Ltd.',
      initialRoute: '/',
      routes: {
        '/': (context) => StandMarkLauncherScreen(),
        '/login': (context) => StandMarkLoginScreen(),
        '/home': (context) => StandMarkHomeScreen(
              title: 'Home',
            ),
        '/services': (context) => StandMarkServicesScreen(
              title: 'Services',
            ),
      },
    );
  }
}

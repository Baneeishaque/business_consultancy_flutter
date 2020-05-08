import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_home_button.dart';
import 'package:flutter/material.dart';

class StandMarkHomeScreen extends StatelessWidget {
  static const String route = '/home';
  final String title;

  StandMarkHomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO : Write function to construct ListView with set of buttons generated from array of strings

    final homeButtonList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(24.0),
      children: <Widget>[
        getStandMarkHomeButton(context, standMarkServices),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkWhatsApp),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkFacebook),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkInstagram),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkTwitter),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkTelegram),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkLinkedIn),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkPinrest),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkWebsite),
        sizedBox24(),
        getStandMarkHomeButton(context, standMarkCallUs),
        sizedBox24(),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: centralizedList(homeButtonList),
      ),
      drawer: getStandMarkDrawer(context),
    );
  }
}

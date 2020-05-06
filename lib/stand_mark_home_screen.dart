import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_home_button.dart';

import 'package:flutter/material.dart';

class StandMarkHomeScreen extends StatelessWidget {
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
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkWhatsapp),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkFacebook),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkInstagram),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkTwitter),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkTelegram),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkLinkedIn),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkPinrest),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkWebsite),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkHomeButton(context, standMarkCallUs),
        SizedBox(
          height: 24.0,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: centralizedListView(homeButtonList),
      ),
      drawer: getStandMarkDrawer(context),
    );
  }
}

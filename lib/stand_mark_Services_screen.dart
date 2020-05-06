import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_service_button.dart';
import 'package:flutter/material.dart';

class StandMarkServicesScreen extends StatelessWidget {
  final String title;

  StandMarkServicesScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeButtonList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(24.0),
      children: <Widget>[
        getStandMarkServiceButton(context, gstRegistration),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, gstFilling),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, incomeTaxFilling),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, companyRegistartion),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, llpRegistration),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, digitalSignature),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, partnershipDeed),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, tradmarkRegistration),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, foodAndSafetyLicense),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, importExportCode),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, msmeCode),
        SizedBox(
          height: 24.0,
        ),
        getStandMarkServiceButton(context, businessFunding),
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

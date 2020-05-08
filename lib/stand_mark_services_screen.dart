import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_service_button.dart';
import 'package:flutter/material.dart';

class StandMarkServicesScreen extends StatelessWidget {
  static const String route = '/services';
  final String title;

  StandMarkServicesScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servicesButtonList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(24.0),
      children: <Widget>[
        getStandMarkServiceButton(context, gstRegistration),
        sizedBox24(),
        getStandMarkServiceButton(context, gstFilling),
        sizedBox24(),
        getStandMarkServiceButton(context, incomeTaxFilling),
        sizedBox24(),
        getStandMarkServiceButton(context, companyRegistration),
        sizedBox24(),
        getStandMarkServiceButton(context, llpRegistration),
        sizedBox24(),
        getStandMarkServiceButton(context, digitalSignature),
        sizedBox24(),
        getStandMarkServiceButton(context, partnershipDeed),
        sizedBox24(),
        getStandMarkServiceButton(context, trademarkRegistration),
        sizedBox24(),
        getStandMarkServiceButton(context, foodAndSafetyLicense),
        sizedBox24(),
        getStandMarkServiceButton(context, importExportCode),
        sizedBox24(),
        getStandMarkServiceButton(context, msmeCode),
        sizedBox24(),
        getStandMarkServiceButton(context, businessFunding),
        sizedBox24(),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: centralizedList(servicesButtonList),
      ),
      drawer: getStandMarkDrawer(context),
    );
  }
}

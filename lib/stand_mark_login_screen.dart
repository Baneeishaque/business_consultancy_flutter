import 'dart:ui';

import 'package:business_consultancy/stand_mark_home_screen.dart';
import 'package:business_consultancy/stand_mark_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StandMarkLoginScreen extends StatelessWidget {
  static const String route = '/login';
  final mobileNumberInputFormKey = GlobalKey<FormState>();

  String validateMobileNumber(String mobileNumber) {
    String pattern = '[0-9]{10}';

    RegExp regExp = new RegExp(pattern);

    if (mobileNumber.isEmpty) {
      return 'Please Enter Your Mobile Number...';
    } else if (!regExp.hasMatch(mobileNumber)) {
      return 'Please Enter Valid Mobile number';
    }
    return null;
  }

  // Create a text controller and use it to retrieve the current value of the TextField.
  final mobileNumberTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileNumberTextField = TextFormField(
      decoration: InputDecoration(
        // counterText: '10',
        // prefixText: '+91',

        // prefixIcon: Padding(
        //   padding: const EdgeInsetsDirectional.only(start: 8),
        //   child: Icon(
        //     Icons.indeterminate_check_box,
        //     semanticLabel: 'Mobile Number Prefix Icon',
        //   ),
        // ),

        prefix: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Text('+91'),
        ),

        // suffix: Padding(
        //   padding: const EdgeInsetsDirectional.only(start: 8),
        //   child: Text('+91'),
        // ),

        // TODO : Use Clear TextField Action - on Edit, show suffix icon, on click suffix icon - remove text
        // suffixIcon: Padding(
        //   padding: const EdgeInsetsDirectional.only(end: 8),
        //   child: Icon(
        //     Icons.indeterminate_check_box,
        //     semanticLabel: 'Mobile Number Suffix Icon',
        //   ),
        // ),

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        semanticCounterText: 'Maximum length of mobile number is 10',
        // helperText: 'Please Enter Your Mobile Number...',
        // icon: Icon(
        //   Icons.mobile_screen_share,
        //   semanticLabel: 'Mobile Number Icon',
        // ),
        labelText: 'Your Mobile Number',
        hintText: 'Enter Your Mobile Number...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      keyboardType: TextInputType.phone,
      autofocus: true,
      controller: mobileNumberTextFieldController,
      minLines: 1,
      maxLines: 1,
      maxLength: 10,
      maxLengthEnforced: true,
      onEditingComplete: () => {},
      textAlign: TextAlign.start,
      // textAlignVertical: TextAlignVertical(y: -1.0),
      textInputAction: TextInputAction.done,
      validator: (mobileNumberText) {
        return validateMobileNumber(mobileNumberText);
      },
    );

    // Paint paintButtonText = Paint();
    // paintButtonText.color = Colors.red;

    final continueButton = RaisedButton(
      // shape: ContinuousRectangleBorder(
      //   // borderRadius: BorderRadius.all(Radius.elliptical(12, 24)),
      //   borderRadius: BorderRadius.circular(24),
      //   // borderRadius: BorderRadius.only(),
      //   // borderRadius: BorderRadius.horizontal(),
      //   // borderRadius: BorderRadius.vertical(),
      // ),

      shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.all(Radius.elliptical(12, 24)),
        borderRadius: BorderRadius.circular(24),
        // borderRadius: BorderRadius.only(),
        // borderRadius: BorderRadius.horizontal(),
        // borderRadius: BorderRadius.vertical(),
      ),

      // shape: BeveledRectangleBorder(

      //   // borderRadius: BorderRadius.all(Radius.elliptical(12, 24)),
      //   borderRadius: BorderRadius.circular(24),
      //   // borderRadius: BorderRadius.only(),
      //   // borderRadius: BorderRadius.horizontal(),
      //   // borderRadius: BorderRadius.vertical(),
      // ),

      // shape: CircleBorder(),
      // padding: EdgeInsets.all(12),
      color: Colors.blueAccent,
      clipBehavior: Clip.antiAlias,
      // disabledColor: Colors.amber,
      // disabledTextColor: Colors.black,
      // focusColor: Colors.yellow,
      // highlightColor: Colors.lime,
//      hoverColor: Colors.greenAccent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//      splashColor: Colors.green,
      // textColor: Colors.black,
      // textTheme: ButtonTextTheme.primary,

      child: Text(
        'Continue...',
        overflow: TextOverflow.clip,
        maxLines: 1,
        semanticsLabel: 'Continue Button',
        softWrap: false,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        textScaleFactor: 1.5,
        textWidthBasis: TextWidthBasis.parent,
        style: TextStyle(
          fontWeight: FontWeight.bold,

          // shadows: [
          //   Shadow(blurRadius: 0.25, color: Colors.red),
          //   Shadow(blurRadius: 0.25, color: Colors.green),
          //   Shadow(blurRadius: 0.25, color: Colors.pink),
          //   Shadow(blurRadius: 0.25, color: Colors.amber),
          // ],

          // letterSpacing: 1.5,
          // fontStyle: FontStyle.italic,
          // fontFeatures: [FontFeature.enable('smcp')],
          // fontFamily: 'Kumar One Outline',
          // decoration: TextDecoration.combine(
          //     [TextDecoration.overline, TextDecoration.underline]),
          // decorationStyle: TextDecorationStyle.double,
          // decorationThickness: 2.0,
          // decorationColor: Colors.orange,
          debugLabel: 'Submit Button',
          color: Colors.white,
          // backgroundColor: Colors.red,
          // background: paintButtonText,
        ),
      ),

      onPressed: () async {
        // Validate will return true if the form is valid, or false if the form is invalid.
        if (mobileNumberInputFormKey.currentState.validate()) {
          // Process data.
          // obtain shared preferences
          final prefs = await SharedPreferences.getInstance();
          // set value
          prefs.setInt('isInitialized', 1);
          prefs.setString(
              'userMobileNumber', mobileNumberTextFieldController.text);
          Navigator.pushNamed(context, StandMarkHomeScreen.route);
        }
      },
    );

    final paddedContinueButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: continueButton,
    );

    final mobileNumberInputForm = Form(
      key: mobileNumberInputFormKey,
      child: ListView(
        shrinkWrap: true,
        semanticChildCount: 2,
        children: <Widget>[
          mobileNumberTextField,
          paddedContinueButton,
        ],
      ),
    );

    final layoutList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        standMarkLogo,
        SizedBox(height: 16.0),
        mobileNumberInputForm,
      ],
    );

    final centeredLayoutList = Center(
      child: layoutList,
    );

    final safeAreaCenteredLayoutList = SafeArea(
      child: centeredLayoutList,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: safeAreaCenteredLayoutList,
    );
  }
}

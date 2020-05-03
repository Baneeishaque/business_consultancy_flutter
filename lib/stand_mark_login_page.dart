import 'dart:ui';

import 'package:flutter/material.dart';

class StandMarkLoginPage extends StatefulWidget {
  @override
  _StandMarkLoginPageState createState() => new _StandMarkLoginPageState();
}

class _StandMarkLoginPageState extends State<StandMarkLoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final mobileNumber = TextFormField(
      decoration: InputDecoration(
        // counterText: '10',
        // prefixText: '+91',
        prefix: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Text('+91'),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Icon(
            Icons.indeterminate_check_box,
            semanticLabel: 'Mobile Number Prefix Icon',
          ),
        ),
        suffix: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Text('+91'),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Icon(
            Icons.indeterminate_check_box,
            semanticLabel: 'Mobile Number Suffix Icon',
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        semanticCounterText: 'Maximum length of mobile number is 10',
        helperText: 'Please Enter Your Mobile Number...',
        icon: Icon(
          Icons.mobile_screen_share,
          semanticLabel: 'Mobile Number Icon',
        ),
        labelText: 'Your Mobile Number',
        hintText: 'Enter Your Mobile Number...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      keyboardType: TextInputType.phone,
      autofocus: true,
      minLines: 1,
      maxLines: 1,
      maxLength: 10,
      maxLengthEnforced: true,
      onEditingComplete: () => {},
      textAlign: TextAlign.start,
      // textAlignVertical: TextAlignVertical(y: -1.0),
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Your Mobile Number...';
        }
        return null;
      },
    );

    Paint paintButtonText = Paint();
    paintButtonText.color = Colors.red;

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
      hoverColor: Colors.greenAccent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashColor: Colors.green,
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

      onPressed: () {
        // Navigator.of(context).pushNamed(HomePage.tag);
        // Validate will return true if the form is valid, or false if the form is invalid.
        if (_formKey.currentState.validate()) {
          // Process data.
        }
      },
    );

    final paddedContinueButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: continueButton,
    );

    final inputForm = Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        semanticChildCount: 2,
        children: <Widget>[
          mobileNumber,
          paddedContinueButton,
        ],
      ),
    );

    final viewList = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        logo,
        SizedBox(height: 16.0),
        inputForm,
      ],
    );

    final centeredViewList = Center(
      child: viewList,
    );

    final safeAreaCenteredViewList = SafeArea(
      child: centeredViewList,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: safeAreaCenteredViewList,
    );
  }
}

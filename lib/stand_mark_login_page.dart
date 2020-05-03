import 'package:flutter/material.dart';

class StandMarkLoginPage extends StatefulWidget {
  static String tag = 'login-page';

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
      keyboardType: TextInputType.phone,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Enter Your Mobile Number...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Your Mobile Number...';
        }
        return null;
      },
    );

    final continueButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        // Navigator.of(context).pushNamed(HomePage.tag);
        // Validate will return true if the form is valid, or false if the form is invalid.
        if (_formKey.currentState.validate()) {
          // Process data.
        }
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Continue...', style: TextStyle(color: Colors.white)),
    );

    final paddedLoginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: continueButton,
    );

    final inputForm = Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          mobileNumber,
          paddedLoginButton,
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 16.0),
            inputForm,
          ],
        ),
      ),
    );
  }
}

import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_service_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class StandMarkServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast them as ScreenArguments.
    final StandMarkServiceArguments args =
        ModalRoute.of(context).settings.arguments;

    Future<void> showSupportDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('StandMark Support...'),
            // content: SingleChildScrollView(
            //   child: ListBody(
            //     children: <Widget>[
            //       Text('You will never be satisfied.'),
            //       Text('You\’re like me. I’m never satisfied.'),
            //     ],
            //   ),
            // ),

            actions: <Widget>[
              FlatButton(
                child: Text('Via Call Back'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Will get a call back within 5 minutes, Thank You...'),
                    duration: Duration(seconds: 3),
                  ));
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Via Direct Call'),
                onPressed: () {
                  launch("tel://9446827218");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Via WhatsApp'),
                onPressed: () {
                  FlutterOpenWhatsapp.sendSingleMessage(
                      "918179015345", "Hello");
                  Navigator.of(context).pop();
                },
              ),

              // ListView(
              //   padding: EdgeInsets.all(0),
              //   shrinkWrap: true,
              //   children: <Widget>[
              //     FlatButton(
              //       child: Text('Via Call Back'),
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //     FlatButton(
              //       child: Text('Via Direct Call'),
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //     FlatButton(
              //       child: Text('Via WhatsApp'),
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //   ],
              // )
            ],
          );
        },
      );
    }

    final supportButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: Colors.blueAccent,
      clipBehavior: Clip.antiAlias,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      hoverColor: Colors.greenAccent,
      splashColor: Colors.green,
      child: Text(
        standMarkSupport,
        overflow: TextOverflow.clip,
        maxLines: 1,
        semanticsLabel: '$standMarkSupport Button',
        softWrap: false,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        // textScaleFactor: 1.0,
        textWidthBasis: TextWidthBasis.parent,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // letterSpacing: 1.5,
          // fontStyle: FontStyle.italic,
          // fontFamily: 'Kumar One Outline',
          debugLabel: '$standMarkSupport Button',
          color: Colors.white,
        ),
      ),
      onPressed: () {
        showSupportDialog();
      },
    );

    String description = args.description;
    final serviceDescription = Text('$description....');

    final servicePageListView = ListView(
      padding: EdgeInsets.all(24.0),
      shrinkWrap: true,
      children: <Widget>[
        supportButton,
        SizedBox(height: 24.0),
        serviceDescription,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: SafeArea(
        child: centralizedListView(servicePageListView),
      ),
      drawer: getStandMarkDrawer(context),
    );
  }
}

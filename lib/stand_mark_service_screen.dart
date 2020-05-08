import 'package:business_consultancy/customized_widgets.dart';
import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_drawer.dart';
import 'package:business_consultancy/stand_mark_service_arguments.dart';
import 'package:business_consultancy/stand_mark_utils.dart';
import 'package:flutter/material.dart';

class StandMarkServiceScreen extends StatefulWidget {
  static const String route = '/service';

  @override
  StandMarkServiceScreenState createState() => StandMarkServiceScreenState();
}

class StandMarkServiceScreenState extends State<StandMarkServiceScreen> {
  @override
  Widget build(BuildContext screenContext) {
    // Extract the arguments from the current ModalRoute settings and cast them as ScreenArguments.
    final StandMarkServiceArguments args =
        ModalRoute
            .of(screenContext)
            .settings
            .arguments;

    Future<void> showSupportDialog() async {
      return showDialog<void>(
        context: screenContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$standMarkSupport...'),
            content: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Text('Seek support from $standMarkPvtLtd...'),
              ],
            ),
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
                  voiceCallToStandMark();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Via WhatsApp'),
                onPressed: () {
                  whatsAppToStandMark();
                  Navigator.of(context).pop();
                },
              ),
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
//      hoverColor: Colors.greenAccent,
//      splashColor: Colors.green,
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
    final serviceDescriptionText = Text('$description....');

    final layoutList = ListView(
      padding: EdgeInsets.all(24.0),
      shrinkWrap: true,
      children: <Widget>[
        supportButton,
        sizedBox24(),
        serviceDescriptionText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: SafeArea(
        child: centralizedList(layoutList),
      ),
      drawer: getStandMarkDrawer(screenContext),
    );
  }
}

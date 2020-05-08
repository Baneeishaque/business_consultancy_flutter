import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_services_screen.dart';
import 'package:business_consultancy/stand_mark_utils.dart';
import 'package:flutter/material.dart';

RaisedButton getStandMarkHomeButton(BuildContext context, String text) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),

    color: Colors.blueAccent,
    clipBehavior: Clip.antiAlias,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//    hoverColor: Colors.greenAccent,
//    splashColor: Colors.green,
    child: Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      semanticsLabel: '$text Button',
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
        debugLabel: '$text Button',
        color: Colors.white,
      ),
    ),
    onPressed: () {
      switch (text) {
        case standMarkServices:
          Navigator.pushNamed(context, StandMarkServicesScreen.route);
          break;
        case standMarkWhatsApp:
          whatsAppToStandMark();
          break;
        case standMarkFacebook:
          break;
        case standMarkInstagram:
          break;
        case standMarkTelegram:
          break;
        case standMarkTwitter:
          break;
        case standMarkWebsite:
          break;
        case standMarkCallUs:
          voiceCallToStandMark();
          break;
        case standMarkLinkedIn:
          break;
        case standMarkPinrest:
          break;
      }
    },
  );
}

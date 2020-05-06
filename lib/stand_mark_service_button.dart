import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:business_consultancy/stand_mark_service_arguments.dart';
import 'package:flutter/material.dart';

RaisedButton getStandMarkServiceButton(BuildContext context, String text) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    color: Colors.blueAccent,
    clipBehavior: Clip.antiAlias,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    hoverColor: Colors.greenAccent,
    splashColor: Colors.green,
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
      Navigator.pushNamed(context, '/service',
          arguments: StandMarkServiceArguments(text, '$text Description...'));
    },
  );
}

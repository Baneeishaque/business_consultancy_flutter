import 'package:business_consultancy/stand_mark_constants.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

void voiceCallToStandMark() {
  launch("tel://$standMarkSupportNumber");
}

void whatsAppToStandMark() {
  FlutterOpenWhatsapp.sendSingleMessage("$standMarkSupportNumber", "Hello...");
}

//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:ai_barcode_web/ai_barcode_web.dart';
import 'package:camera_web/camera_web.dart';
import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:geolocator_web/geolocator_web.dart';
import 'package:sms_advanced/sms_advanced_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AiBarcodeWebPlugin.registerWith(registrar);
  CameraPlugin.registerWith(registrar);
  DeviceInfoPlusPlugin.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  GeolocatorPlugin.registerWith(registrar);
  SmsAdvancedPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}

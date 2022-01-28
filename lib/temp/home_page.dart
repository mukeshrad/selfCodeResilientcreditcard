import 'package:finandy/temp/app_list.dart';
import 'package:finandy/temp/contacts_view.dart';
import 'package:finandy/temp/phone_details.dart';
// import 'package:finandy/temp/qr_scan.dart';
import 'package:finandy/services/permissions.dart';
import 'package:finandy/utils/choose.dart';
import 'package:finandy/temp/location_view.dart';
import 'package:finandy/screens/personal-info.dart';
import 'package:flutter/material.dart';
import 'package:finandy/temp/sms_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class MyHomePage extends StatefulWidget {
  static String id = "home" ;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  func(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Uptrack"),
      // ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/sms')}, text: "SMS info"),
            // Choose(func: ()=>{phoneCallHandler(context)}, text: "Phone Call"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/device')}, text: "Device info"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/qrscan')}, text: "QR scanner"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/location')}, text: "Current location"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/apps')}, text: "Apps info"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/contacts')}, text: "Contacts"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/personalInfo')}, text: "PersonalInfo"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/pay')}, text: "Pay"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/otp')}, text: "otp"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/proinfo')}, text: "Professional info"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/proinfo')}, text: "Professional info"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/reqPerm')}, text: "Permission Request"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/root')}, text: "Homepage"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/getst')}, text: "startScreen1"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/Bilpay')}, text: "Bil Pay"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/quickPay')}, text: "Quick Pay"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/apis')}, text: "Card Apis"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/notificationlist')}, text: "Notification list"),
            // Choose(func: ()=>{Navigator.of(context).pushNamed('/upipayment')}, text: "UPI Payment"),
            Choose(func: ()=>{Navigator.of(context).pushNamed('/NotificationListPage')}, text: "Notification Screen list"),


          ],
        ),
      )
    );
  }
}
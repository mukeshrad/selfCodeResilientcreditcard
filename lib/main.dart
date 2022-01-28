import 'package:finandy/screens/Payment/Bil_Pay.dart';
import 'package:finandy/screens/Payment/Notification/Notification_List.dart';
import 'package:finandy/screens/Payment/Quick%20Pay/QuickPay.dart';
import 'package:finandy/screens/Upi%20Payment/UPIPayment.dart';
import 'package:finandy/screens/otp_verify.dart';
import 'package:finandy/screens/professional_info.dart';
import 'package:finandy/screens/request_permissions.dart';
import 'package:finandy/screens/root_page.dart';
import 'package:finandy/screens/transaction-successful-qr_scan-screen3.dart';
import 'package:finandy/temp/app_list.dart';
import 'package:finandy/temp/contacts_view.dart';
import 'package:finandy/temp/home_page.dart';
import 'package:finandy/temp/location_view.dart';
import 'package:finandy/temp/phone_details.dart';
import 'package:finandy/screens/personal-info.dart';
import 'package:finandy/temp/sms_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  await init();
  runApp(const MyApp());
}


Future init() async {

  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onMessage.listen((RemoteMessage message)
  {
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      print('Title ${notification.title}');
      print('Body ${notification.body}');
      print('onMessage: ${notification.body.toString()}');

    }});

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {

    var data = message.toString();
    print('onMessageOpenedApp: {$data}');

  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

const Color black = Color(0xFF000000);


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  void initState(){
    // this.setNotification(context);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'EcoHop',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //
      //   primaryColor: Colors.black,
      //   //primarySwatch: Colors.black,
      //
      // ),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: const MyHomePage(),
      initialRoute: MyHomePage.id,
      routes: {
        '/apps': (context) => const AppsListScreen(),
        // '/qrscan': (context) => const FullScreenScannerPage(),
        '/': (context) => const MyHomePage(),
        '/location': (context) => const LocationDetails(),
        '/contacts': (context) => const ContactsView(),
        '/sms': (context) => SmsInbox(),
        '/device' : (context) => const DeviceDetails(),
        '/personalInfo': (context) => const PersonalInfo(),
        '/pay': (context) => const PayScreen(),
        '/otp': (context) => const OTPverify(),
        '/reqPerm': (context) => const RequestPermissions(),
        '/proinfo': (context) => const ProfessionalDetails(),
        '/root': (context) => const RootPage(),
        // '/getst': (context) => const StartedScreen1(),
        '/Bilpay': (context) => const BilPay(),
        '/quickPay': (context) => const QuickPay(),
        // '/apis': (context) => const Apis(),
        '/upipayment': (context) => const UpiPayment(),
        // '/notificationlist': (context) => const NotificationList(),
        '/NotificationListPage': (context) => const NotificationListPage()

      },
    );
  }

   setNotification(BuildContext context){

    FirebaseMessaging.onMessage.listen((RemoteMessage message)
    {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        print('Title ${notification.title}');
        print('Body ${notification.body}');

        // notificationTitle = notification.title ?? "";
        // notificationBody = notification.body ?? "";
        // notificationData = "";

        // setState(() {
        //
        // });

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Title : ${notification.title}, Body : ${notification.body}'),)
        );

      }});


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {

      print("onMessageOpenedApp: $message");

    });

  }
}

import 'package:flutter/material.dart';

// // import 'package:finandy/screens/app_list.dart';
// // import 'package:finandy/screens/contacts_view.dart';
// // import 'package:finandy/screens/home_page.dart';
// // import 'package:finandy/screens/location_view.dart';
// // import 'package:finandy/screens/phone_details.dart';
// // import 'package:finandy/screens/qr_scan.dart';
// // import 'package:finandy/screens/personal-info.dart';
// // import 'package:finandy/screens/sms_list.dart';
// // import 'package:flutter/material.dart';
// //
// // void main() => runApp(const MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context){
// //     return MaterialApp(
// //       title: 'EcoHop',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.red,
// //       ),
// //       // home: const MyHomePage(),
// //       initialRoute: MyHomePage.id,
// //       routes: {
// //         '/apps': (context) => const AppsListScreen(),
// //         '/qrscan': (context) => const FullScreenScannerPage(),
// //         '/': (context) => const MyHomePage(),
// //         '/location': (context) => const LocationDetails(),
// //         '/contacts': (context) => const ContactsView(),
// //         '/sms': (context) => SmsInbox(),
// //         '/device' : (context) => const DeviceDetails(),
// //         'personalInfo': (context) => const PersonalInfo()
// //       },
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// void main () => runApp(MaterialApp(
//   home: Scaffold(
//     body: Center(
//       child: PageForm(),
//     ),
//   ),
// ));
//
// class PageForm extends StatefulWidget {
//   @override
//   _PageFormState createState() => _PageFormState();
// }
// class _PageFormState extends State<PageForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool isChecked = false;
//   var _phone;
//   var _autoValidate;
//   List<String> text1_ = ["Good", "Moderate"];
//   List<String> text2_ = ["Checking...", "Almost Done!", "We are Sorry!"];
//   List<String> text3_ = ["Please wait few minutes checking your cibil score.",
//     "Sorry for making you wait\nJust a few moments more, We are \nalmost done checking your cibil score.",
//     "Hey, You cannot access to our Services as your Cibil Score is not appropriate."];
//   List<String> button_ = ["Next", "Go Back"];
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         autovalidateMode: AutovalidateMode.always,
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             Text(
//               text1_[1],
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: const Color(0xff141414),
//                 fontSize: 20,
//                 fontFamily: "Inter",
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//                 text2_[1],
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: const Color(0xff141414),
//                   fontSize: 32,
//                   fontFamily: "Inter",
//                   fontWeight: FontWeight.w700,
//                 )),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: 311,
//               child: Opacity(
//                 opacity: 0.75,
//                 child: Text(
//                   text3_[1],
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Color(0xff141414),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 200),
//             FlatButton(
//               color: Colors.black,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)
//               ),
//               onPressed: () {
//                 if(_formKey.currentState!.validate()){
//                   _formKey.currentState!.save();
//                   print(_phone);
//                 }else {
//                   setState(() {
//                     _autoValidate = true;
//                   });
//                 }
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                       'Next',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold)
//                   ),
//                   SizedBox(width: 20),
//                   Icon(Icons.arrow_forward, color: Colors.white,)
//                 ],
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }
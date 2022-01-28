import 'package:flutter/material.dart';

// void main () => runApp(MaterialApp(
//   home: Scaffold(
//     body: Padding(
//       padding: const EdgeInsets.all(20),
//       child: PageForm(),
//     ),
//   ),
// ));

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}
class _PageFormState extends State<PageForm> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  var _phone;
  var _autoValidate;
  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
                "Let's Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff141414),
                  fontSize: 32,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(height: 20),
            SizedBox(
              width: 311,
              child: Opacity(
                opacity: 0.75,
                child: Text(
                  "Ladder provides you with customised \noffers based on your profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff141414),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 200),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile Phone',
              ),
              onSaved: (value){
                _phone = value;
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "Please enter your Mobile Phone";
                }
                return null;
              },
            ),
            FlatButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  print(_phone);
                }else {
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Text(
                  "Already have an account? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Sign in')
                )
              ],
            ),

          ],
        )
    );
  }
}

///////// Minor Changes //////////
// import 'package:flutter/material.dart';
// void main () => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: Scaffold(
//     body: SingleChildScrollView(
//       child: Container(
//         margin: EdgeInsets.only(left: 25,right: 25,top: 120, bottom: 50),
//         child: PageForm(),
//       ),
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
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       // autovalidateMode: AutovalidateMode.always,
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//                 "Let's Get Started",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xff141414),
//                   fontSize: 32,
//                   fontFamily: "Inter",
//                   fontWeight: FontWeight.w700,
//                 )),
//             SizedBox(height: 10),
//             SizedBox(
//               width: 311,
//               child: Opacity(
//                 opacity: 0.75,
//                 child: Text(
//                   "Ladder provides you with customised \noffers based on your profile",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xff141414),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 300),
//             TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Mobile Phone',
//               ),
//               onSaved: (value){
//                 _phone = value;
//               },
//               validator: (value) {
//                 if(value?.length != 10){
//                   return "Please enter Correct Mobile Phone";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height:10 ,),
//             FlatButton(
//               padding: EdgeInsets.all(12.5),
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
//                 children: [
//                   Text(
//                       'Next',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20
//                       )
//                   ),
//                   SizedBox(width: 20),
//                   Icon(Icons.arrow_forward, color: Colors.white,size: 24,)
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Already have an account? ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal
//                   ),
//                 ),
//                 TextButton(
//                     style: TextButton.styleFrom(
//                         textStyle: TextStyle(
//                             fontWeight: FontWeight.normal
//                         )
//                     ),
//                     onPressed: () {},
//                     child: const Text('Sign in')
//                 )
//               ],
//             ),
//
//           ],
//         )
//     );
//   }
// }
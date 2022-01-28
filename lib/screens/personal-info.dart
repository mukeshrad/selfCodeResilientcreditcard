import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  static String id = 'personalInfo';
  const PersonalInfo({ Key? key }) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}
//
class _PersonalInfo extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 25,right: 25,top: 70,bottom:90 ),
        child: PageForm(),
      ),
    ),
  );
  }
}
class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}
class _PageFormState extends State<PageForm> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  var _user;
  var _mailid;
  var _pincode;
  var _autoValidate;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        // autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
                "Personal Info.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff141414),
                  fontSize: 32,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(
              width: 311,
              child: Opacity(
                opacity: 0.75,
                child: Text(
                  "Fill in the details below to\nGet Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff141414),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              onSaved: (value){
                _user = value;
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "Please enter your username";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Id',
              ),
              onSaved: (value){
                _mailid = value;
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "Please enter your Email id";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pin Code',
              ),
              onSaved: (value){
                _pincode = value;
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "Please enter your Pin Code";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 260,
                    child: Opacity(
                      opacity: 0.75,
                      child: Text(
                        "I hereby appoint Ladder as my authorised representative to receive my credit information from Cibil/Equifax/Experian/",
                        style: TextStyle(
                          color: Color(0xff141414),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  print(_user);
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
            )
          ],
        )
    );
  }
}

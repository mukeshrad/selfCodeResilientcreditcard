import 'package:flutter/material.dart';

class PayScreen extends StatefulWidget {
  static String id = 'pay';
  const PayScreen({ Key? key }) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreen();
}
//
class _PayScreen extends State<PayScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Successful!"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25,right: 25,top: 30,bottom:90 ),
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
            Container(
              width: 351,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Color(0xfff0f0f0), width: 1, ),
                color: Colors.white,
              ),
              child: Text("Account Name",
                style: TextStyle(),),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
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
            Container(
              height: 100,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                onSaved: (value){
                  _mailid = value;
                },
              ),
            ),
            SizedBox(height: 120),
            FlatButton(
              padding: EdgeInsets.all(12.5),
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
                      'Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}

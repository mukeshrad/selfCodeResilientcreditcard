import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPverify extends StatefulWidget {
  static String id = "otp";
  const OTPverify({ Key? key }) : super(key: key);

  @override
  _OTPverifyState createState() => _OTPverifyState();
}

class _OTPverifyState extends State<OTPverify> {

  getVerified(ctx){
   try {
     
     showVerifiedModal(ctx);
   } catch (e) {
     rethrow;
   }
    
  }

  showVerifiedModal(ctx){
   return showDialog(
            context: ctx,
            builder: (BuildContext context) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(CupertinoIcons.checkmark_alt_circle_fill, size: 75, color: Colors.green[400],),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text("OTP Verified", 
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 25
                         ),
                         ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: const Text("Kindly spare a few moments for us. We need to know you better", 
                         style: TextStyle(
                           fontSize: 20
                         ),
                         ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(onPressed: (){},
                         style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Start Now", style: TextStyle(fontSize: 20),),
                              SizedBox(width: 10,),
                              Icon(Icons.arrow_forward_sharp)
                            ],
                          ),
                        ) 
                   ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children: [
               Container(
                 margin: const EdgeInsets.only(top: 70, bottom: 30, left: 20, right: 20),
                 child: const Placeholder(fallbackHeight: 275, fallbackWidth: 75,)
                 ),
                 Container(
                   padding: const EdgeInsets.symmetric(vertical: 10),
                   child: const Text(
                     "OTP Verification",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 22,
                     ),
                   ),
                 ),
                 const Padding(
                   padding: EdgeInsets.all(5),
                   child: Text("An OTP sent on your mobile number please verify", 
                     style: TextStyle(fontSize: 15),
                     textAlign: TextAlign.center,
                   ),
                 ),
                 Container(
                   margin: const EdgeInsets.only(bottom: 20, top: 10),
                   child: OtpTextField(
                      numberOfFields: 6,
                      
                      borderColor: Colors.blueGrey,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true, 
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        
                          //handle validation or checks here           
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode){
                          showDialog(
                              context: context,
                              builder: (context){
                              return AlertDialog(
                                  title: const Text("Verification Code"),
                                  content: Text('Code entered is $verificationCode'),
                              );
                              }
                          );
                      }, // end onSubmit
                ),
                 ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                child: ElevatedButton(onPressed: () => showVerifiedModal(context), 
                   style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center, 
                       children: const [
                         Text("Submit", style: TextStyle(fontSize: 20),),
                         SizedBox(width: 10,),
                         Icon(Icons.arrow_forward_sharp)
                       ],
                     ),
                   ) 
                   ),
              ),
               GestureDetector(
                 child: const Text("Resend OTP",style: TextStyle(fontSize: 16),),
                 onTap: (){Navigator.of(context).pushNamed('/reqPerm');},
               )
             ],
           ),
         ),
       ),
    );
  }
}
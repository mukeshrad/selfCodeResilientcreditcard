import 'package:flutter/material.dart';

class RequestPermissions extends StatefulWidget {
  static String id = 'reqPerm';
  const RequestPermissions({ Key? key }) : super(key: key);

  @override
  _RequestPermissionsState createState() => _RequestPermissionsState();
}

class _RequestPermissionsState extends State<RequestPermissions> {
  bool granted = false;

  generateNote(String s) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children:  [
           const Text("◼",
           style: TextStyle(
             color: Colors.black45,
             fontSize: 23
           ),
          ),
          const SizedBox(width: 30,),
          Text(s,
           style: const TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.w600
           ),
          ) 
        ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Allow Permissions", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                ),
              ),
              const Text("We need these permissions to serve you", 
                 style: TextStyle(
                   fontSize: 20,
                 ),
                 textAlign: TextAlign.center,
              ),
              generateNote("SMS"),
              generateNote("Storage"),
              generateNote("Camera"),
              generateNote("Contacts"),
              generateNote("Location"),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Checkbox(value: granted, onChanged: (change){setState(() {
                    granted = !granted;
                  });}),
                  const SizedBox(width: 15,),
                  const Expanded(
                    child: Text(
                      "I hereby appoint Ladder as my authorised representative to receive my credit information from Cibil/Equifax/Experian/", 
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 4,
                      softWrap: true,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){}, 
      
                     style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        primary: Colors.grey
                      ),
                     child: const Padding(
                       padding: EdgeInsets.all(12.0),
                       child: 
                           Text("Decline", style: TextStyle(fontSize: 20),),
                     ) 
                     ),
                     
                     ElevatedButton(onPressed: () {Navigator.of(context).pushNamed("/proinfo");}, 
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 5), 
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow", style: TextStyle(fontSize: 20),),
                        ) 
                     ),
                  ],
                ),
              )  
            ],
          ),
        ),
      ),
    );
  }
}
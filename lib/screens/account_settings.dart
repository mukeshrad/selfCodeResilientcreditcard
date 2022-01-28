import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({ Key? key }) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {

  menuOption(String s) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        tileColor: Colors.grey[200],
        shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(width: 0.5, color: Colors.white)
          ),
        leading:  Text(s,
           style: const TextStyle(
             fontSize: 17,
           ),
        ),
        onTap: (){},
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Account Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
             menuOption("Language"),
             menuOption("Notifications"),
          ],
        ),
      ),
    );
  }
}
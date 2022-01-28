import 'package:finandy/utils/credit_card.dart';
import 'package:flutter/material.dart';

class SetPin extends StatefulWidget {
  const SetPin({ Key? key }) : super(key: key);

  @override
  _SetPinState createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {

   bool _showPassword = false;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Set Pin"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               UptrackCard(),
               Column(
                 children: [
                   TextFormField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: "Pin*",
                    hintText: "Pin",
                    // border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglevisibility();
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons
                            .visibility_off, color: Colors.grey,),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: confirmpasswordController,
                  decoration: const InputDecoration(
                    labelText: "Confirm Pin*",
                    hintText: "Confirm Pin",
                    // border: InputBorder.none,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Check", style: TextStyle(fontSize: 20),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_sharp)
                          ],
                        ),
                      ) 
                    ),
                  ),
                 ],
               )
             ],
          ),
        ),
      ),
    );
  }
}
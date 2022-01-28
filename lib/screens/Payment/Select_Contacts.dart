import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectContacts extends StatefulWidget {
  const SelectContacts({Key? key}) : super(key: key);

  @override
  _SelectContactsState createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        leading: BackButton(color: Colors.black),
    title: const Text(
    "Select Contacts",
    style: TextStyle(color: Colors.black),
    ),
            actions: <Widget>[



              IconButton(onPressed: (){
                print("Work");
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectContacts()));

              }, icon: const Icon(Icons.search,)),
              SizedBox(
                width: 10,
              ),
            ]

            ,
    ),
    body:  ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(

          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            // color: Colors.red,
            height: 90,

            child: Column(
              children: [

                Container(

                  padding: EdgeInsets.only(top: 20),

                  // height: 40,
                  child: Row(

                    children: [

                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        height: 50,
                        width: 50,
                        child: Center(child: Text("AK",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal),),),
                      ),

                      SizedBox(

                        width: 20,
                      ),

                      Container(

                        child: Column(

                          children: [
                          Text("Aditya Kumar",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                            SizedBox(

                              height: 5,
                            ),
                            Text("09876543210",style: TextStyle(color: Colors.black,fontSize: 17))
                          ],
                        ),


                      )



                    ],
                  ),



                ),
                Spacer(),
                Container(

                  height: 1,
                  color: Colors.grey.withOpacity(0.5),



                )



              ],
            ),

          ),
        );
      },
    )
    );
  }
}



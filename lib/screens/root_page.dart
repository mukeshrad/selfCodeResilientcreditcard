import 'package:finandy/constants/texts.dart';
import 'package:finandy/utils/bill_and_credit.dart';
import 'package:finandy/utils/credit_card.dart';
import 'package:finandy/utils/expenses_card.dart';
import 'package:finandy/utils/nav_drawer.dart';
import 'package:finandy/utils/rewards_and_offers.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  static String id = "root";
  const RootPage({ Key? key }) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  bottomModalSheet(){
    return showModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isDismissible: false,
            elevation: 5,
            builder: (BuildContext context) {
              return Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      child: const Icon(Icons.keyboard_arrow_down_rounded),
                      onTap: () => Navigator.pop(context),
                      ),
                    playModal()
                  ],
                ),
              );
            },
          );
        }

   playModal(){
     return Column(
       children: [
         Text("Answer and win ₹ 1 instant cashback"),
         SizedBox(height: 10,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text("Do you have a Vehicle?"),
             ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               ),
               child: const Padding(
                 padding: EdgeInsets.all(5.0),
                 child: Text("Car", style: TextStyle(fontSize: 12),),
               ) 
                     ),
              ElevatedButton(onPressed: (){},
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Bike/Scooter", style: TextStyle(fontSize: 15),),
                ) 
                     ),
              ElevatedButton(onPressed: (){},
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Planning", style: TextStyle(fontSize: 15),),
                ) 
                     ),      

              const Text("*Terms & Conditions")                   
           ],
         ),
       ], 
     );
   }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              CircleAvatar(
               radius: 12,
               foregroundImage: NetworkImage(userImg),
               ),
             Text("Welcome, $userName", style: const TextStyle(
                fontSize: 18
               ),
               overflow: TextOverflow.fade,
             )
           ],
          ),
          bottom: PreferredSize(
            preferredSize: Size(30, 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.white,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Chattarpur", 
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Text("New Delhi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.confirmation_num_outlined)
              ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_none_sharp)
              )  
          ],
      ),
      floatingActionButton: FloatingActionButton(
          // elevation: 4.0,
          child: const Icon(Icons.qr_code_scanner_sharp), onPressed: () {},
        ),
      drawer: const NavDrawer(),
        floatingActionButtonLocation: 
           FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.money),
                    Text("Quick Pay")
                  ],
                ),
              ),
            ),
            // if (centerLocations.contains(fabLocation)) const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 5),
              child: const Text("Scan and Pay", textAlign: TextAlign.center,)
              ),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.credit_card_rounded),
                    Text("Card Settings")
                  ],
                ),
              ),
            ),
          ],
        )
      ),    
      body: ListView(
        children: [
          UptrackCard(),
          ExpensesCard(),
          BillAndCreditSection(),
          RewardsAndOffers(),
          Card(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: const Text("Instant Cashback Prices for You",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Container(
                        //  padding: const EdgeInsets.all(8.0),
                         child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(cashback,
                                 maxLines: 3,
                                 style: const TextStyle(
                                   fontSize: 14
                                 ),
                               ),
                             const SizedBox(height: 10,),
                             ElevatedButton(
                               onPressed: bottomModalSheet,
                               child: const Text("Play"),
                             )
                           ],
                         ),
                        )
                       ),
                       Expanded(child: Image.asset("assets/images/cashback.gif",))  
                   ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
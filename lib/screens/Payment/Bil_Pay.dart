import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Select_Contacts.dart';

class BilPay extends StatefulWidget {
  static String id = "Bilpay";
  const BilPay({Key? key}) : super(key: key);

  @override
  _BilPayState createState() => _BilPayState();
}

class _BilPayState extends State<BilPay> {
  String val = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          "Pay Bill",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // verticalDirection: VerticalDirection.up,

                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 15, bottom: 15),
                              height: 90,
                              width: 100,
                              child: Image.asset("asset/Paymenticon/card.png",),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Due Date",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 20, top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "₹ 2,100",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Dec 10,2021",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        // Container(
                        //   height: 20,
                        // ),
                        Container(
                          height: 5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.grey,width: 1),
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),

                          height: 20,
                          // color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 28),
              child: ListTile(
                // dense: true,

                  trailing: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text('Pay'),
                    ),
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        child: Radio(
                            value: 'Phonepay',
                            groupValue: val,
                            onChanged: (val) {}
                            ),
                      ),
                      SvgPicture.asset(
                        'asset/Paymenticon/phonpe.svg',
                        width: 100,
                        height: 32,
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text('Select Another Payment Application',style: TextStyle(fontSize: 18),),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            paycard(context, 'gpay'),
            paycard(context, 'gpay'),
            paycard(context, 'gpay'),
            // paycard(context, 'gpay'),
            // paycard(context, 'gpay'),
          ],
        ),
      ),
    );
  }

  Card paycard(BuildContext context, String assetname) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: Container(
            width: 1,
          ),
          leading: Container(
              // width: 20,
            // color: Colors.red,
              child: Radio(
                  value: 'Phonepay', groupValue: val, onChanged: (val) {

              })),
          title: SvgPicture.asset(
            'asset/Paymenticon/$assetname.svg',
            width: 70,
            alignment: Alignment.centerLeft,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    isDense: true,
                    labelText: 'Mobile Number',
                    suffixIcon: IconButton(onPressed: (){
                      print("Work");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectContacts()));

                    }, icon: const Icon(Icons.perm_contact_cal,)),//,
                    fillColor: Colors.grey.shade200),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Center(
                    child: Text(
                      'Proceed to pay',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

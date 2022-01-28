import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart' as io;

import 'package:finandy/screens/Upi%20Payment/src/api.dart';
import 'package:finandy/screens/Upi%20Payment/src/discovery.dart';
import 'package:finandy/screens/Upi%20Payment/src/meta.dart';
import 'package:finandy/screens/Upi%20Payment/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Payment_Declined.dart';
import 'Payment_Received.dart';
import 'Payment_RequestSend.dart';

const appWhiteColor = Color(0xFFFFFFFF);
const appWhite1Color = Color(0xFFF5F5F5);
const appBlackColor = Color(0xFF000000);
const appGreyColor =   Color(0xFFCCCCCC);
const appGreyDarkColor =  Color(0xFF616161);

const appRedBGColor =  Color(0xFFFF5130);
const appBlueGColor =  Color(0xFF084E6C);





class BilPay extends StatefulWidget {

  static String id = "Billpay";
  const BilPay({Key? key}) : super(key: key);

  @override
  _BilPayState createState() => _BilPayState();

}

class _BilPayState extends State<BilPay> {

  String val = '';
  List<TextEditingController> listControlers = [TextEditingController(),TextEditingController(),TextEditingController()];

  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  String? _upiAddrError;
  final _upiAddressController = TextEditingController();
  final _amountController = TextEditingController();
  List<ApplicationMeta>? _apps; // System Aps upi

  var selectIndex = 0;

  var responce = "";

  initiateTransaction() async {


    String upiUrl = 'upi://pay?pa=7220858116@apl&pn=Deepak Kumar&am=10.0&cu=INR';
    await launch(upiUrl).then((value) {
      if (kDebugMode) {
        print(value);
      }
    }).catchError((err) => print(err));

  }

  Future<void> _onTap(ApplicationMeta app) async {
    // final err = _validateUpiAddress(_upiAddressController.text);
    // if (err != null) {
    //   setState(() {
    //     _upiAddrError = err;
    //   });
    //   return;
    // }
    // setState(() {
    //   _upiAddrError = null;
    // });

    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Starting transaction with id $transactionRef");

    String price = "10.0";
    String upi = "7220858116@apl";

    final paymentResponce = await UpiPay.initiateTransaction(
      amount: price,
      app: app.upiApplication,
      receiverName: 'Sharad',
      receiverUpiAddress: upi,
      transactionRef: transactionRef,
      transactionNote: 'UPI Payment',
      // merchantCode: '7372',
    );

    print(paymentResponce.toString());


    if (paymentResponce.status == UpiTransactionStatus.failure) {

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentDeclined()));

    } else if (paymentResponce.status == UpiTransactionStatus.success) {

      var now = DateTime.now();
      var formatter1 = new DateFormat('MMM dd, yyyy'); //yyyy-MM-dd
      String getDate = formatter1.format(now);
      print(getDate);

      var formatter2 = new DateFormat('hh:mm a'); //yyyy-MM-dd
      String getTime = formatter2.format(now);
      print(getTime);

      var paymentDetails = UpiPaymentResponse();
      paymentDetails.amount = "₹ " + price;
      paymentDetails.cardNumber = upi;
      paymentDetails.transID = paymentResponce.txnId.toString();
      paymentDetails.date =  getDate;
      paymentDetails.time =  getTime;
      paymentDetails.location = "";

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentReceived(paymenData: paymentDetails, isFrome: 'BilPay',)));

    }else{
      if (io.Platform.isAndroid) {
        _showAlert(context,paymentResponce.rawResponse.toString());
      }else {
        _showAlert(context,paymentResponce.toString());
      }


    }


  }

  void _showAlert(BuildContext context,String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Response"),
          content: Text(text),
        )
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();

    listControlers[0].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;
    listControlers[1].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;
    listControlers[2].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;
    //

    setState(() { });

    Future.delayed(Duration(milliseconds: 0), () async {
      _apps = (await UpiPay.getInstalledUpiApplications(
          statusType: UpiApplicationDiscoveryAppStatusType.all)).cast<ApplicationMeta>();
      setState(() {});
      print(_apps?.length);
      print("--------- -- -- -- - -- -- - ");
    });


  }



// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;



    setState(() {

      _mobileNumber = mobileNumber;

      print("_mobileNumber $_mobileNumber");
      print(_simCard.length);

      listControlers[0].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;
      listControlers[1].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;
      listControlers[2].text = _mobileNumber == '' ? "1234567890" : _mobileNumber;


    });
  }




  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: appBlackColor),
        title: const Text(
          "Pay Bill",
          style: TextStyle(color: appBlackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: appGreyColor, width: 1),
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
                              padding: const EdgeInsets.only(
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
                          color: appGreyColor.withOpacity(0.5),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.grey,width: 1),
                              color: appBlackColor,
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
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text('Select Another Payment Application',style: TextStyle(fontSize: 18),),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: 100,
              child :  (_apps != null) ? _appsGrid(_apps!.map((e) => e).toList()) : Text(""),

            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentRequestSend()));

              },
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 0, top: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appRedBGColor, borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Center(
                    // PaymentDeclined
                      child: Text(
                        'Request Sent',
                        style: TextStyle(color: appWhiteColor),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appsGrid(List<ApplicationMeta> apps) {
    return Container(
      height:  apps.length * 70,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        // Let the ListView know how many items it needs to build.
        itemCount: apps.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = apps[index];
          return  Container(

            margin: EdgeInsets.only(top: 10),

            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 28),
              child: ListTile(
                // dense: true,

                  onTap: () async {

                    setState(() {
                      selectIndex = index;

                    });
                    await _onTap(apps[index]);


                  },

                  trailing: Container(
                    decoration: BoxDecoration(
                        color: appGreyColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text('Pay'),
                    ),
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Container(

                        child: selectIndex == index ? Image.asset("asset/Paymenticon/check1.png", height: 20,width: 20,) : Image.asset("asset/Paymenticon/uncheck1.png", height: 20,width: 20,),
                        padding: EdgeInsets.only(right: 10),


                      ),

                      apps[index].iconImage(24),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                            apps[index].upiApplication.getAppName()
                        ),
                      ),

                      // SvgPicture.asset(
                      //   'asset/Paymenticon/phonpe.svg',
                      //   width: 100,
                      //   height: 32,
                      // )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  Card paycard(BuildContext context, String assetname,TextEditingController controler) {
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
            color: appGreyDarkColor,
          ),
        ),
      ),
    );
  }



  String? _validateUpiAddress(String value) {
    if (value.isEmpty) {
      return 'UPI VPA is required.';
    }
    if (value.split('@').length != 2) {
      return 'Invalid UPI VPA';
    }
    return null;
  }


}

class UpiPaymentResponse {
  late String amount;
  late String cardNumber;
  late String transID;
  late String date;
  late String time;
  late String location;
}
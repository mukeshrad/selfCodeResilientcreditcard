import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfessionalDetails extends StatefulWidget {
  static String id = 'proinfo';
  const ProfessionalDetails({ Key? key }) : super(key: key);

  @override
  _ProfessionalDetailsState createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  DateTime selectedDate = DateTime.now();
  TextEditingController occuType = TextEditingController();
  TextEditingController monthInc = TextEditingController();
  TextEditingController panController = TextEditingController(); 
  TextEditingController dobController = TextEditingController();

  int income = 0;
  String occupation = "";
  String panNo = "";
  int dob = 0;  

  // setIncome(){
  //   String inc = monthInc.text;
  //    final currencyFormatter = NumberFormat('##,##,##,##0.00', 'ID');
  //    print(currencyFormatter.format(inc));

  //    setState(() {
  //      income = inc;
  //    }); 
  // }

  // setDob(){
  //   String dobU = dobController.text;
  //   setState(() {
  //     dob = dobU;
  //   });
  // }

  // setOccu(){

  // }

  generateDateFormat(DateTime dateTime){
    List months = 
        ['January', 'February', 'March', 'April', 'May','June','July','August','September','October','November','December'];
    String day = dateTime.day.toString();
    String month = months[dateTime.month-1];    
    String year = dateTime.year.toString();

    String date = "$month $day, $year";
    return date;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1945, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      
      setState(() {
        dob = picked.millisecondsSinceEpoch;
        selectedDate = picked;
        dobController.text = generateDateFormat(picked);
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
          child: Column(
             children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text("Professional Info", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),
              ),
                ),
             
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text("Enter your personal information to check your cibil score.", 
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 20,
                   ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        DropdownButtonFormField(
                           validator: (value) {
                                if (value == null) {
                                  return 'Required';
                                }
                                return null;
                              },    
                          items: const [
                            DropdownMenuItem(child: Text("Salaried"), value: "Salaried",),
                            DropdownMenuItem(child: Text("Non-Salaried"), value: "Non-Salaried",),
                          ],
                          onChanged: (c){
                            String occuType = c.toString();
                            setState(() {
                              occupation = occuType;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "Occupation Type*",
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: monthInc,
                          onChanged: (value) {
                            String inc = monthInc.text.trim();
                            final currencyFormatter = NumberFormat('##,##,##,##0.00', 'ID');
                            setState(() {
                              monthInc.text = currencyFormatter.format(inc);
                              income = int.parse(inc);
                            });
                          },
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: "Monthly Income*",
                          ),
                        ),
                        const SizedBox(height: 20,),
                         TextFormField(
                          controller: panController, 
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          onChanged: (change){
                             String pan = change.trim();
                                setState(() {
                                  panNo = pan;
                                });                       
                              },
                          validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: "PAN number*",     
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: dobController,
                          keyboardType: TextInputType.datetime,
                          // initialValue: selectedDate.toString(),
                          enabled: true,
                          readOnly: true,
                          textCapitalization: TextCapitalization.characters,
                          validator: (value) {
                            
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                          decoration: InputDecoration(
                            hintText: "Select Date",
                            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            labelText: "Date of Birth*",   
                            enabled: true,
                            suffixIcon: IconButton( onPressed: ()=>_selectDate(context), icon: const Icon(Icons.calendar_today_sharp,))  
                          ),
                        ),
                    ],
                   ),
                  ),
              ),
                Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
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
          ),
        ),
      ),
    );
  }
}
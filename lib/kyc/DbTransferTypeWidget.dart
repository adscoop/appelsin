import 'dart:convert';

import 'package:appelsin/apis/AppelsinKycApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Kyc.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/kyc/CountryListWidget.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/kyc/DbDescripbeYourCompanyWidget.dart';
class TransferTypeWidget extends StatefulWidget {
  final Appelsinbruger appelsinbruger;
  const TransferTypeWidget({Key? key, required this.appelsinbruger}): super(key: key);

  @override
  State<TransferTypeWidget> createState() => _TransferTypeWidgetState();
}

class _TransferTypeWidgetState extends State<TransferTypeWidget> {
  late Appelsinkycapi _appelsinkycapi; 
  late String danish_only;
  late List<String> countries;
  bool leftSelected = false;
  bool rightSelected = false;
bool showKistWidget = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
_appelsinkycapi = Appelsinkycapi();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black12),
        title: const Text(
          "Overførselstype",
          style: TextStyle(color: Colors.black),
        ),
      ),
        body: SafeArea(
          child: SingleChildScrollView( // 👈 Gør hele siden scrollable
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Customwidgets.step(0.2, "2", "4"),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: const Text(
                    "Hvilken type overførsler planlægger du at lave?",
                    style: TextStyle(fontFamily: "Sora", fontSize: 12),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Venstre option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          leftSelected = true;
                          rightSelected = false;
                          showKistWidget = false;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 173,
                        height: 180,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: leftSelected ? Colors.blue[100] : const Color(0xFFF9F7F4),
                          border: Border.all(
                            width: 1,
                            color: leftSelected ? Colors.blue : const Color(0xFFEEE3D8),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image.asset("assets/images/appelsin_pos_dk@2x.png", width: 50,height: 50),
                            const SizedBox(height: 12),
                            const Text(
                              'Kun danske',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF231303),
                                fontSize: 16,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Højre option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rightSelected = true;
                          leftSelected = false;
                          showKistWidget = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 173,
                        height: 180,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: rightSelected ? Colors.blue[100] : const Color(0xFFF9F7F4),
                          border: Border.all(
                            width: 1,
                            color: rightSelected ? Colors.blue : const Color(0xFFEEE3D8),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image.asset("assets/images/appelsin_pos_dk@2x.png", width: 50,height: 50),
                            const SizedBox(height: 12),
                            const Text(
                              'Både danske \nog internationale',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF231303),
                                fontSize: 16,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if(showKistWidget)
                  CountryListWidget(
                    lande: (selected) {
                      print("Selected countries: $selected");
                      countries = selected;
                    },
                  ),
SizedBox(height: 300),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(context).size.width, 48),
    ),
                    onPressed: () {
      AddToKyc();
                      navigateWithSlide(context, DbDescripbeYourCompanyWidget(appelsinbruger: widget.appelsinbruger), SlideDirection.left);
                    },
                    child: const Text("Videre"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(context).size.width, 48),
    ),
                    onPressed: (){

                    },
                    child: const Text("Spring over"),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
  Future<void> AddToKyc() async{
  final kyc = Kyc(appelsinBrugerId: widget.appelsinbruger.id!, linje: jsonEncode(countries), isDone: true,step:  'Har du danskeBank');
 final respose =  await  _appelsinkycapi.createKyc(kyc, widget.appelsinbruger.id!);
  }
}

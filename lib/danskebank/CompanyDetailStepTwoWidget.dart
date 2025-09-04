import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:riff_switch/riff_switch.dart';
import 'package:appelsin/danskebank/AlmostDoneWidget.dart';
class CompanyDetailStepTwoWidget extends StatefulWidget {
  const CompanyDetailStepTwoWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompanyDetailStepTwoWidget();
}

class _CompanyDetailStepTwoWidget extends State<CompanyDetailStepTwoWidget> {
  bool _modtag = false;
  String _hvorofte = '';
  String _hvorofte2 = '';
  bool _betalerLeverandoerIKontanter = false;

  bool hvorOfteModager = false;
  bool hvorOfteModager2 = false;
  bool _kunderOver15K = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Virksomhedsdetaljer")),
      body: SafeArea(
        child: SingleChildScrollView( // så der er plads til begge blokke
          child: Column(
            children: [


              // Første spørgsmål (kunder)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: _boxDecoration(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            "Forventes ind- og udbetalinger af kontanter?",
                            style: TextStyle(fontFamily: 'FigTree'),
                          ),
                        ),
                        RiffSwitch(
                          width: 70,
                          type: RiffSwitchType.simple,
                          value: _modtag,
                          onChanged: (bool newValue) {
                            setState(() {
                              _modtag = newValue;
                            });
                          },
                          inactiveTrackColor: Colors.white,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.blue,
                          activeText: const Text("YES",
                              style: TextStyle(color: Colors.white)),
                          inactiveText: const Text("NO",
                              style: TextStyle(color: Colors.white)),
                          inactiveThumbColor: Colors.black,
                        )
                      ],
                    ),

                  ],
                ),
              ),


              if(_modtag)

                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: _boxDecoration(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Modtager selskabet betalinger i kontakter fra sine kunder?",
                                  style: TextStyle(fontFamily: 'FigTree'),
                                ),
                              ),
                              RiffSwitch(
                                width: 70,
                                type: RiffSwitchType.simple,
                                value: hvorOfteModager,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    hvorOfteModager = newValue;
                                  });
                                },
                                inactiveTrackColor: Colors.white,
                                activeTrackColor: Colors.white,
                                activeColor: Colors.blue,
                                activeText: const Text("YES",
                                    style: TextStyle(color: Colors.white)),
                                inactiveText: const Text("NO",
                                    style: TextStyle(color: Colors.white)),
                                inactiveThumbColor: Colors.black,
                              )
                            ],
                          ),
                          if (hvorOfteModager)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Hvor ofte sker det?"),
                                _buildRadioOption("Dagligt"),
                                _buildRadioOption("Ugenligt"),
                                _buildRadioOption("Månedligt"),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Er der kunder, sin betaler nere \nebd DKK 15.000,- pr. år i kontanter?'),
Spacer(),
                                    RiffSwitch(
                                      width: 70,
                                      type: RiffSwitchType.simple,
                                      value: _kunderOver15K,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          _kunderOver15K = newValue;
                                        });
                                      },
                                      inactiveTrackColor: Colors.white,
                                      activeTrackColor: Colors.white,
                                      activeColor: Colors.blue,
                                      activeText: const Text("YES",
                                          style: TextStyle(color: Colors.white)),
                                      inactiveText: const Text("NO",
                                          style: TextStyle(color: Colors.white)),
                                      inactiveThumbColor: Colors.black,
                                    )
                                  ],
                                )
                              ],

                            )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: _boxDecoration(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Betaler virksomheden leverandører i kontanter?",
                                  style: TextStyle(fontFamily: 'FigTree'),
                                ),
                              ),
                              RiffSwitch(
                                width: 70,
                                type: RiffSwitchType.simple,
                                value: hvorOfteModager2,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    hvorOfteModager2 = newValue;
                                  });
                                },
                                inactiveTrackColor: Colors.white,
                                activeTrackColor: Colors.white,
                                activeColor: Colors.blue,
                                activeText: const Text("YES",
                                    style: TextStyle(color: Colors.white)),
                                inactiveText: const Text("NO",
                                    style: TextStyle(color: Colors.white)),
                                inactiveThumbColor: Colors.black,
                              )
                            ],
                          ),
                          if (hvorOfteModager2)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Hvor ofte sker det?"),
                                _buildRadioOption2("Dagligt"),
                                _buildRadioOption2("Ugenligt"),
                                _buildRadioOption2("Månedligt"),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Er der leverandører, som selskabet \nbetaler mere end DKK 15.000,- pr. gang?'),
                                   Spacer(),
                                    RiffSwitch(
                                      width: 70,
                                      type: RiffSwitchType.simple,
                                      value: _betalerLeverandoerIKontanter,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          _betalerLeverandoerIKontanter = newValue;
                                        });
                                      },
                                      inactiveTrackColor: Colors.white,
                                      activeTrackColor: Colors.white,
                                      activeColor: Colors.blue,
                                      activeText: const Text("YES",
                                          style: TextStyle(color: Colors.white)),
                                      inactiveText: const Text("NO",
                                          style: TextStyle(color: Colors.white)),
                                      inactiveThumbColor: Colors.black,
                                    )
                                  ],
                                )

                              ],
                            )
                        ],
                      ),
                    )
                  ],
                )
              // Andet spørgsmål (leverandører)
             ,
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Hvad er din virksomheds forventede samlede omsætning over de næste 12 måneder eksklusiv moms?',
                        style: TextStyle(
                          color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                          fontSize: 16,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Container(
                            width: 54,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 28,
                                  height: 32,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child:Image.asset("assets/images/3x/pos_appelsinillu@3x.png", width: 24, height: 24),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 226,
                            child: Text(
                              'Op til 50.000 kr',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 64,
                                  height: 50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Image.asset("assets/images/3x/pos_appelsiner@3x.png", width: 24, height: 24),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 226,
                            child: Text(
                              'Op til 100.000 kr',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 54,
                                  height: 47,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Image.asset("assets/images/3x/pos_kasse@3x.png", width: 24, height: 24),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 216,
                            child: Text(
                              'Over 100.000 kr',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ,
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(top: 20, left: 16, right: 15),
              child:
              Column(
                children: [
                  Container(margin: EdgeInsets.only(bottom: 6),
                    child:      ElevatedButton(onPressed: () {
                      navigateWithSlide(context, AlmostDoneWidget(), SlideDirection.left);
                    }, child: Text("Videre"),

                      style:  ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 22)
                      ),) ,
                  )
             ,
                  ElevatedButton(onPressed: () {}, style:  ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(context).size.width, 22),

                    backgroundColor: Colors.orange.shade100
    ), child: Text('Spring over'))
                ]
              ),
            )
            ],
          ),
        ),
      ),
    );
  }

  /// Radio til kunder
  Widget _buildRadioOption(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label.toLowerCase(),
          groupValue: _hvorofte,
          onChanged: (value) {
            setState(() {
              _hvorofte = value ?? '';
            });
          },
        ),
        Text(label),
      ],
    );
  }

  /// Radio til leverandører
  Widget _buildRadioOption2(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label.toLowerCase(),
          groupValue: _hvorofte2,
          onChanged: (value) {
            setState(() {
              _hvorofte2 = value ?? '';
            });
          },
        ),
        Text(label),
      ],
    );
  }

  ShapeDecoration _boxDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: Color(0xFFEEE3D8),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

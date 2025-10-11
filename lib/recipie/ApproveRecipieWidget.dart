import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:flutter/material.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class Approverecipiewidget  extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _Approverecipiewidget();
    
  
}

class _Approverecipiewidget extends State<Approverecipiewidget> {

  TextEditingController _amount = TextEditingController();
  TextEditingController _commen = TextEditingController();
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(
        title: const Text(
          'Opret ny regning',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF231303), // primary-dark-brown-dark-brown-200
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
        body: SingleChildScrollView(
           child: Column(children: [
            Customwidgets.buildLabel("Beløb", margin: EdgeInsets.only(left: 16, right: 16, bottom: 3)),
             Customwidgets.textField(_amount),
             Customwidgets.buildLabel("Kommenter", margin: EdgeInsets.only(left: 16, right: 16, bottom: 3)),
             Customwidgets.textField(_commen),
             SizedBox(height: 300),
             Container(
               alignment: Alignment.bottomCenter,
               child: CircleSlideToActionButton(
                 //slideToActionController: controller2,
                 width: 250,
                 parentBoxRadiusValue: 27,
                 circleSlidingButtonSize: 47,
                 leftEdgeSpacing: 3,
                 rightEdgeSpacing: 3,
                 initialSlidingActionLabel: 'Godkent',
                 finalSlidingActionLabel: 'Er Godkent',
                 circleSlidingButtonIcon: const Icon(
                   Icons.hourglass_empty_outlined,
                   color: Colors.blue,
                 ),
                 parentBoxBackgroundColor: Colors.blue,
                 parentBoxDisableBackgroundColor: Colors.grey,
                 /*  parentBoxGradientBackgroundColor:
                    LinearGradient(colors: [Colors.red, Colors.white]),
                parentBoxDisableGradientBackgroundColor:
                    LinearGradient(colors: [Colors.red, Colors.white]),*/
                 circleSlidingButtonBackgroundColor: Colors.white,
                 isEnable: true,
                 onSlideActionCompleted: () {
                   print("Sliding action completed");
                 },
                 onSlideActionCanceled: () {
                   print("Sliding action cancelled");
                 },
               ),
             )
             
           ])
        ),
      );
    }
}
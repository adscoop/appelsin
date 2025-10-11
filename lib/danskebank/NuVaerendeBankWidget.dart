import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/danskebank/ConnectDanskeBankWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nuvaerendebankwidget  extends StatefulWidget {
  
  @override
    State<StatefulWidget> createState() => _Nuvaerendebankwidget();
}

class _Nuvaerendebankwidget extends State<Nuvaerendebankwidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
    Widget build(BuildContext context) {
   return Scaffold(appBar:  AppBar(title: Text(
     'Nuværende bank',
     textAlign: TextAlign.center,
     style: TextStyle(
       color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
       fontSize: 20,
       fontFamily: 'Figtree',
       fontWeight: FontWeight.w400,
     ),
   ),),
     body: SafeArea(child: Column(
       children: [
         Customwidgets.step(0.3, "3", "10"),
         Container(height: 300,
           child: 
         GridView.count(crossAxisCount: 3),
         ),
         
         Customwidgets.textField(textEditingController, prefix: Icon(Icons.search)),
         Spacer(),
         Container(
           margin: EdgeInsets.only(left: 16 , right: 16),
             child:ElevatedButton(onPressed: (){
            navigateWithSlide(context, Connectdanskebankwidget(), SlideDirection.left);
             }, child: Text(
               'Vælg Danske Bank',
               style: TextStyle(
                 color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                 fontSize: 17,
                 fontFamily: 'Figtree',
                 fontWeight: FontWeight.w600,
               ),
             )) ,
         )
       ],
     )),
   );
    }
}
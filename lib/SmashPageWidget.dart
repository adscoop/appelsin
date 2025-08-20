

import 'package:appelsin/LoginWidget.dart';
import 'package:appelsin/signup/NameWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets/NavigatorDirection.dart';
import 'customwidgets/SlideDirection.dart';
class SmashPageWidget  extends StatefulWidget {

  @override
    State<StatefulWidget> createState() => _SmashPageWidget();
}

class _SmashPageWidget extends State<SmashPageWidget> {
  int _currentIndex = 0;
 final List<Widget> widgets = [
   Container(),
   Container(),
   Container(),
   Container()
  ];
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
backgroundColor: Colors.blue.shade800,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Text("Appelsin", style: TextStyle(fontFamily: 'Sora' , color: Colors.white),),
        ),
        body: SafeArea(

          child:  Column(

              children: [
                Container(
                  alignment: Alignment.center,
                  width: 338,
                  child: Text(
                    'Dyrk det du er \nBedst til',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 1.29,
                      letterSpacing: -1.12,
                    ),
                  ),
                ),
                Container(
                  width: 402,
                  height: 414,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      // Slide in from right
                      final slideAnimation = Tween<Offset>(
                        begin: Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(position: slideAnimation, child: child);
                    },
                    child: widgets[_currentIndex],
                  ),
                ),
                Container(child: Text("click")),
                Spacer(),
                Container(

                  child: Column(
                    children: [
                      Container(

                        width: double.infinity,
                        height: 70,
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(MediaQuery.of(context).size.width, 30)
                            ),
                            onPressed: (){
                              navigateWithSlide(context , Namewidget(), SlideDirection.up);

                            }, child: Text("Kom i gang med Appelsin")),
                      ),
                      Container(

                          width: double.infinity,
                          height: 70,
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                          child: ElevatedButton(
                              style:  ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade200,
                                  foregroundColor:CupertinoColors.darkBackgroundGray,
                                  fixedSize: Size(MediaQuery.of(context).size.width, 30)
                              ),
                              onPressed: (){
                                navigateWithSlide(context, Loginwidget(), SlideDirection.down);

                              }, child: Text("Login"))
                      )
                    ],
                  ),
                )

            ],

          ),
        ),
      );
    }


}

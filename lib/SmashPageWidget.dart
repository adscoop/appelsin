

import 'package:appelsin/LoginWidget.dart';
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/signup/NameWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customwidgets/NavigatorDirection.dart';
import 'customwidgets/SlideDirection.dart';
import 'dart:convert' as convert;

class SmashPageWidget  extends StatefulWidget {

  @override
    State<StatefulWidget> createState() => _SmashPageWidget();
}

class _SmashPageWidget extends State<SmashPageWidget> {

  
  late Appelsinapi _appelsinapi;
  bool _isJwtReady = false; // Track JWT status

  @override
    void initState() {
      super.initState();
      _appelsinapi = Appelsinapi();
      setJwt();
    }
    
    Future<void> setJwt() async {
    try {
      SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
      final response = await _appelsinapi.getJwt();
      String bearer =  response.body;
      final decoded = convert.jsonDecode(bearer) as Map<String, dynamic>;
      String jwtToken = decoded['token']; // Replace 'token' with your actual key name
      await  sharedPreferences.setString("jwt", jwtToken);
      print('JWT saved successfully: $jwtToken');
      setState(() {
        _isJwtReady = true;
      });
    } catch (e) {
      print('Error fetching JWT: $e');
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to initialize authentication')),
      );
    }
    }
  int _currentIndex = 0;
 final List<Widget> widgets = [
   Container(
margin: EdgeInsets.only(top: 80, bottom: 0, left: 0, right: 0),
     child: Column(children: [
  Container(child: Image.asset("assets/images/3x/appelsin_neg_skateboard@3x.png",fit:  BoxFit.contain)),
       Container(
         margin: EdgeInsets.only(top: 4),
           child: Text('next'))
  ],
  ),
   ),
   Container(


       child: Stack(
         children: <Widget>[
           // Background

           Positioned(
             right: 0,
             top: 0,
             bottom: 100,
             child: Image.asset("assets/images/3x/neg_appelsinillu@3x.png"),
           ),

           Positioned(
             top: 140,
             left: 10,
             child: Image.asset(
               "assets/images/info 1.png", // 🔹 rename file without spaces

             ),
           ),


           Positioned(
             top: 170,
             right: 16,

             child: Image.asset(
               "assets/images/overlay 1.png", // 🔹 rename file without spaces

             ),
           ),
         ],
       )),

   Container(
     child: Stack(
       children: [
         Positioned(
           top: 10,
           right: 10,
           child: Image.asset("assets/images/appelsin.png"),
         ),
         Positioned(
           right: 30,
           top: 20,
           child: Image.asset(
             "assets/images/source_camera.png",
             width: 118,
             height: 133,
           ),
         ),
         Positioned(
           top: 100,
           left: 40,
           child: Image.asset(
             "assets/images/source_betaling.png",
             width: 187,
             height: 188,
           ),
         ),
         Positioned(
           right: 40,
           top: 120,
           child: Image.asset(
             "assets/images/illu@2x.png",
             width: 120,
             height: 146.5,
           ),
         ),
       ],
     ),
   ),

  Container(
  child: Stack(
  children: [
  Positioned(
    top: 40,
    left: 20,
  right: 20,
  child: ClipOval(
  child: Image.asset(
  "assets/images/source_Screenshot 2025-05-22 at 12.32.11.png", // 🔹 rename without spaces
  fit: BoxFit.cover,
    // you need width & height for oval shape
  height: 200,
  ),
  ),
  ),
  ],
  ),

),

 ];
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
backgroundColor: const Color(0xFF0354F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0354F0),
          title: Image.asset('assets/images/appelsinTekstLogo.png', width: MediaQuery.of(context).size.width, height: 70),
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
                  child: PageView(
                    controller: PageController(initialPage: 0),

children: widgets,
                  ),
                ),
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

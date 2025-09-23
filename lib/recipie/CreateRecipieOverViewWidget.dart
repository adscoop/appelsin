import 'dart:typed_data';
import 'dart:convert'; // for base64

import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/recipie/ApproveRecipieWidget.dart';
import 'package:appelsin/recipie/RecipieCameraWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences

class Createrecipieoverviewwidget  extends StatefulWidget{

  const Createrecipieoverviewwidget({Key? key}): super(key: key);
  @override
    State<StatefulWidget> createState() => _Createrecipieoverviewwidget();
}

class _Createrecipieoverviewwidget extends State<Createrecipieoverviewwidget> {
  late List<Uint8List> picture;
  
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      picture = <Uint8List>[];
      _loadPicturesFromPrefs(); // load from SharedPreferences
    }
    
    Future<void> loadPictures() async {
    picture = List.empty(growable: true);
    }
    
    Future<void> _loadPicturesFromPrefs() async {
      try {
        final prefs = await SharedPreferences.getInstance();
        // Expecting a StringList of base64 images under 'captured_pictures_b64'
        final List<String> b64List = prefs.getStringList('captured_pictures_b64') ?? const [];
        final decoded = <Uint8List>[];
        for (final b64 in b64List) {
          if (b64.isEmpty) continue;
          try {
            decoded.add(base64Decode(b64));
          } catch (_) {
            // skip invalid entries
          }
        }
        if (mounted) {
          setState(() {
            // keep the passed-in picture first, then loaded ones (avoid duplicates)
            final existingFirst = picture.isNotEmpty ? picture.first : null;
            picture = <Uint8List>[
              if (existingFirst != null) existingFirst,
              ...decoded,
            ];
          });
        }
      } catch (_) {
        // ignore errors for now
      }
    }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(child: Column(
        children: [
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ...picture.map((bytes) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        bytes,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                  // Placeholder tile
                  GestureDetector(
                    onTap: () {
navigateWithSlide(context, Recipiecamerawidget(), SlideDirection.down);                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, color: Colors.grey.shade600),
                          const SizedBox(height: 6),
                          Text(
                            'Tilføj',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right:  16 , bottom: 20),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(onPressed: (){
              navigateWithSlide(context, Approverecipiewidget(), SlideDirection.left);
            }, child: Text("Videre", style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w600,
            ),)  ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0354F0),
    fixedSize: Size(MediaQuery.of(context).size.width, 22)
    )
            ),
          )
        ],
      )),
    );
    }
}
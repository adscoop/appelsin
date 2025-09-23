
import 'dart:typed_data';
import 'dart:convert';

import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/recipie/CreateRecipieOverViewWidget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Recipiecamerawidget extends StatefulWidget {
  const Recipiecamerawidget({super.key});

  @override
  State<Recipiecamerawidget> createState() => _Recipiecamerawidget();
}

class _Recipiecamerawidget extends State<Recipiecamerawidget> with WidgetsBindingObserver{
CameraController? _controller;
late Future<void> _initFuture;
List<CameraDescription> _cameras = [];
bool _isCapturing = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initFuture = _initCamera();
  }
  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    final back = _cameras.firstWhere((c) =>
    c.lensDirection == CameraLensDirection.back, orElse: () => _cameras.first);
    _controller = CameraController(
        back, ResolutionPreset.high, enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420);
    await _controller?.initialize();
    if (!mounted) return;
    setState(() {

    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      // TODO: implement didChangeAppLifecycleState
      super.didChangeAppLifecycleState(state);
      final controller = _controller;
      if(controller == null ||!controller.value.isInitialized)return;
      if(state == AppLifecycleState.inactive) {
        controller.dispose();
      } else if (state == AppLifecycleState.resumed) {
        _initFuture = _initCamera();
        setState(() {
                  
                });
      }
      
    }
    
    @override
    void dispose (){
  WidgetsBinding.instance.removeObserver(this);
  _controller?.dispose();
  super.dispose();
    }

    Future<void> _takePicture(BuildContext context) async {
    final controller = _controller;
        if(controller == null || !controller.value.isInitialized)  {
          return;
        }
          final XFile file = await controller.takePicture();
        final Uint8List byted = await file.readAsBytes();
        print('Capturd ${byted.length} bytes');
        if(byted.isNotEmpty) {
        SharedPreferences shared =  await SharedPreferences.getInstance();
        // Load existing list (if any), append new picture as Base64, and save
        final key = 'captured_pictures_b64';
        final List<String> existing = shared.getStringList(key) ?? <String>[];
        final String b64 = base64Encode(byted);
        existing.add(b64);
        await shared.setStringList(key, existing);

          navigateWithSlide(context, Createrecipieoverviewwidget(), SlideDirection.left);
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
        centerTitle: true,
      ),
      // floatingActionButton: IconButton(onPressed: () {}, icon: Icon(Icons.power_sharp)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: 16, right:  16, bottom: 16),
      //   decoration: BoxDecoration(
      //     shape: BoxShape.rectangle,
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.black, // adjust
      //     unselectedItemColor: Colors.black54, // adjust
      //     currentIndex: 0,
      //     onTap: (index) async {
      //       if (index == 1) {
      //         print('take picture');
      //         await _takePicture(context);
      //       }
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.white,
      //         icon: Icon(Icons.home_outlined),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.white,
      //         icon: Icon(Icons.camera),
      //         label: 'Camera',
      //
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.white,
      //         icon: Icon(Icons.person_outline),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
      body: FutureBuilder<void>(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final controller = _controller;
          if (controller == null || !controller.value.isInitialized) {
            return const Center(child: Text('Camera not available'));
          }
          return Stack(
            children: [

              // Camera preview behind UI
              Positioned.fill(
                child: CameraPreview(controller),
              ),
              Container(
                height: 33,
                margin: EdgeInsets.only(top: 50 , left: 16),
                alignment: Alignment.topRight,
                child: ElevatedButton(onPressed: () {}, child: Text("Flash")),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 40 , bottom: 16),
                 alignment: Alignment.bottomCenter,
                   child: Row(
          children: [
              ElevatedButton.icon(onPressed: () {}, label:Icon(Icons.abc)  ,  style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),),
              ElevatedButton(onPressed:  () {
                _takePicture(context);
              }, child: Text("Child")),
  ElevatedButton(onPressed: () {}, child: Text("Folder"))
              
          ],
          ) ,
              )
              // Foreground content respecting safe areas
            
            ],
          );
        },
      ),
    );
  }

  Widget _roundIconButton({double size = 40, double? innerSize}) {
    final double inner = innerSize ?? (size / 2);
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          width: inner,
          height: inner,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
        ),
      ),
    );
  }
}
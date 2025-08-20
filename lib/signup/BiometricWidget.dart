
import 'package:appelsin/services/BiometricService.dart';
import 'package:flutter/material.dart';

class Biometricwidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _Biometricwidget();
}

class _Biometricwidget extends State<Biometricwidget> {
  late Biometricservice _biometricservice;

  @override
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _biometricservice = Biometricservice();
    }
  @override
    Widget build(BuildContext context) {

    return  Scaffold(
      appBar:  AppBar(
        title: Text("Nemmere log ind"),
      ),
      body: SafeArea(child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [

              Container(

                width: 200,
                height: 200,
                child: GestureDetector(
                    onTap:  ()   {
                      isface();
                    },
                    child: Text("Image"))
              ),
            Spacer(),
            Container(
              child: ElevatedButton(onPressed: (){}, child: Text("Ja benyt face id ")),
            ),
            Container(
              child: ElevatedButton(onPressed: (){}, child: Text("Nej")),
            )
          ],
        ),
      )),
    );
    }

    Future<void> isface( ) async {
      final res = await    _biometricservice.authenticateWithBiometrics();
    if(res) {
      print("You can log in");
    } else {
      print("you can not login");
    }

    }
}
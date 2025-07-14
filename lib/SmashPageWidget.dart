

import 'package:flutter/material.dart';

class SmashPageWidget  extends StatefulWidget {

  @override
    State<StatefulWidget> createState() => _SmashPageWidget();
}

class _SmashPageWidget extends State<SmashPageWidget> {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
        ),
        body: SafeArea(child: Container(
          child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
          child:  Column(
              children: [
              Stack(
                children: [
                  Positioned(
                      child: Text("")),
                  Positioned(child: Text("")),
                  Positioned(child: Text(""))
                ],
              ),
                Container(
                  child: Text("Fedt du tilslutte dig Appelsin fortæl os lidt \n om dig selv, så vi kan oprette en bruger"),
                ),
                Container(

                  child: Text("Werner Valeur \n founder"),
                ),
                Container(
                  child: ElevatedButton(onPressed: (){}, child: Text("Kom i gang med Appelsin")),
                ),
                Container(
                  child: ElevatedButton(onPressed: (){}, child: Text("Login"))
                )
            ],
          ),
          ),
        )),
      );
    }
}

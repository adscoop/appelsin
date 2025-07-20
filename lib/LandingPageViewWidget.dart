

import 'package:flutter/material.dart';

class Landingpageviewwidget  extends StatefulWidget{

  @override
    State<StatefulWidget> createState() => _Landingpageviewwidget();


}

class _Landingpageviewwidget extends State<Landingpageviewwidget> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16, // lidt spacing fra venstre kant

        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.orange,
            onPressed: () {
              print("Profil ikon trykket");
            },
          ),
        ],
      ),

        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: Text("28.123", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
              child:Chip(
                label: Text(
                  "Transaktioner",
                  style: TextStyle(color: Colors.orange),
                ),
                backgroundColor: Colors.orange.shade100,
                shape: StadiumBorder(),
                 // Giver "pill" form
              )

                ,
              ),
              Container(
                height: 330,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.only(left: 40, right: 40, top: 80),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        children: [
                          Text("Forventet fremtidige saldo"),
                          Spacer(),
                          Text("31 juli 2025", style: TextStyle(color: Colors.orange.shade800),)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 30),
                      child: Text("36.570", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Text("Udgifter"),
                                Spacer(),
                                Text("-5666" , style: TextStyle(color: Colors.red.shade900),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

                            child: Row(
                              children: [
                                Text("Indtægter"),
                                Spacer(),
                                Text("4555", style: TextStyle(color: Colors.green.shade800),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

                            child: Row(
                              children: [
                                Text("Vis detaljer",style: TextStyle(color: Colors.orange.shade800), ),
                                Spacer(),
                                Text("Justere udregning",style: TextStyle(color: Colors.orange.shade800))
                              ],
                            ),
                          )
                        ],
                      ),
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
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Connectdanskebankwidget  extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _Connectdanskebankwidget();
}

class _Connectdanskebankwidget extends State<Connectdanskebankwidget> {
  
  bool _hasChoose = false;
  
  @override
    Widget build(BuildContext context) {
      
    return Scaffold(appBar: AppBar(
      title: Text(
        'Danske Bank',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
          fontSize: 20,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
      body: SafeArea(child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/3x/appelsin_pos_win@3x.png"),
            ),
            Container(
              child: Text(
                'Fedt, du kan alligevel få fordelene uden at skifte bank',
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
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  SizedBox(
                    width: 338,
                    child: Text(
                      'Giver du din bankrådgiver samtykke til, at de må forbinde din bankkonto og Appelsin?',
                      textAlign: TextAlign.center,
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
                    width: 338,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                    ),
                  ),
                  Container(

                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Container(
                        child:  Checkbox(value: _hasChoose, onChanged: (value) => {
                          setState(() {
                                                      _hasChoose = true;
                                                    })
                        }),
                        ),
                        SizedBox(
                          width: 298,
                          child: Text(
                            'Ja tak, min bankrådgiver må gerne koble appelsin sammen med min bank',
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 16,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
            Container(
              margin: EdgeInsets.only(bottom: 100, right: 16, left: 16 , top: 100),
              child: ElevatedButton(onPressed: () {}, child: Text(
                'Afslut registrering',
                style: TextStyle(
                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                  fontSize: 17,
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                ),
              )),
            )
          ],
        ),
      )),
    );
    }
}
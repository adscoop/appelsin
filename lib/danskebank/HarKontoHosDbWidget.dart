import 'package:flutter/material.dart';

class HarKontoHosDbWidget extends StatefulWidget {
  const HarKontoHosDbWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HarKontoHosDbWidget();
}

class _HarKontoHosDbWidget extends State<HarKontoHosDbWidget> {
  bool _allowContact = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Har danske bank"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/3x/appelsin_pos_win@3x.png"),

            Container(
              margin: const EdgeInsets.only(left: 16, right: 10, top: 16),
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F7F4), // primary-dark-brown-beige-5
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFEEE3D8), // primary-dark-brown-beige-20
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 338,
                    child: Text(
                      'Giver du din bankrådgiver samtykke til, at de må forbinde din bankkonto og Appelsin?',
                      style: const TextStyle(
                        color: Color(0xFF231303), // primary-dark-brown-dark-brown-200
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    width: 338,
                    height: 1,
                    color: const Color(0xFFE2CFBD), // primary-dark-brown-beige-40
                  ),

                  const SizedBox(height: 16),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              color: Color(0xFF9ABBF9), // primary-fresh-blue-fresh-blue-40
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Checkbox(value: _allowContact, onChanged: (value) => {
                          setState(() {
                            _allowContact = true;
                          })
                        },),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Ja tak, min bankrådgiver må gerne koble Appelsin sammen med min bank',
                          style: TextStyle(
                            color: Color(0xFF231303),
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if(_allowContact)
              Container(
                child: ElevatedButton(onPressed: () {
                  
                }, child: Text("Videre")),
              )

          ],
        ),
      ),
    );
  }
}

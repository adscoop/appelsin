import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'DbTransferTypeWidget.dart';
class DbSamtykkeWidget extends StatefulWidget {
  const DbSamtykkeWidget({super.key});

  @override
  State<DbSamtykkeWidget> createState() => _DbSamtykkeWidgetState();
}

class _DbSamtykkeWidgetState extends State<DbSamtykkeWidget> {
  bool _givSamtykke = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Samtykke"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for logo / image
              Container(
                width: 128,
                height: 128,
                decoration: const BoxDecoration(),
                child: Image.asset("assets/images/appelsin_pos_win@2x.png"),
              ),
              const SizedBox(height: 24),

              // Title text
              const SizedBox(
                width: 360,
                child: Text(
                  'Fedt, så er du tættere på at have din Appelsin-konto klar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF231303),
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Consent box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF9F7F4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFEEE3D8),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Giver du din bankrådgiver samtykke til, at de må forbinde din bankkonto og Appelsin?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF231303),
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Divider
                    Container(height: 1, color: Color(0xFFE2CFBD)),
                    const SizedBox(height: 16),

                    // Consent row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24
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
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: ElevatedButton(onPressed: (){
                  navigateWithSlide(context, TransferTypeWidget(), SlideDirection.left);
                }, child: Text("Forsæt")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

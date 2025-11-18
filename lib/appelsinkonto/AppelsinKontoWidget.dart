import 'package:appelsin/kyc/HarKontoHosDbWidget.dart';
import 'package:appelsin/kyc/OpretDbWidget.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart' as a;
import 'package:appelsin/customwidgets/NavigatorDirection.dart' as nav;
import 'package:appelsin/customwidgets/SlideDirection.dart';
class Appelsinkontowidget extends StatefulWidget {

  final Appelsinbruger appelsinbruger;

  const Appelsinkontowidget({Key? key, required this.appelsinbruger}) : super(key: key);

  @override
  State<Appelsinkontowidget> createState() => _AppelsinkontowidgetState();
}

class _AppelsinkontowidgetState extends State<Appelsinkontowidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bankkonto med Appelsin'),
      ),
    body:SafeArea(child: Container(alignment: Alignment.center,margin: EdgeInsets.only(left: 16,right: 16), child:
      Column(
        children: [
          Container(
            child: a.Customwidgets.step(0.4, "6", "10"),
          ),
          Container(
            child: Image.asset("assets/images/3x/neg_kreditkort@3x.png", width: 100, height: 100,)
          ),
          Container(
            width: double.infinity,
            height: 408,
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
                    'Vil du have en bankkonto og firmakort med Appelsin?',
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
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Container(
                      width: 338,
                      height: 17,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Expanded(child: Container(height: 15)),
                          SizedBox(
                            width: 85,
                            child: Text(
                              'Appelsin',
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
                          SizedBox(
                            width: 85,
                            child: Text(
                              'Andre',
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
                        ],
                      ),
                    ),
                    Container(
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Firmakort',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Bankkonto',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 338,
                      height: 1,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        SizedBox(
                          width: 140,
                          child: Text(
                            'Lokale overførsler',
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.71,
                            ),
                          ),
                        ),
                        Container(
                          width: 85,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 85,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 338,
                      height: 1,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2CFBD) /* primary-dark-brown-beige-40 */,
                      ),
                    ),
                    Container(
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // Replaced tight spacing with explicit SizedBox to avoid overflow on small screens
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          const SizedBox(width: 4),
                          // Make the label flexible so it can ellipsize instead of overflowing
                          Expanded(
                            child: Text(
                              'Internationale overførsler',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: const TextStyle(
                                color: Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Keep trailing content at a fixed max width but allow Row to resolve without overflow
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 156, minHeight: 16),
                            child: SizedBox(
                              height: 16,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 51,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(),
                                            child: Stack(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 72,
                                    top: 0,
                                    child: SizedBox(
                                      width: 84,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Stack(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'FIK- & girokort',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Real time feed',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      width: 338,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Banksupport',
                              style: TextStyle(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ElevatedButton(onPressed: () {
              nav.navigateWithSlide(context, Opretdbwidget(email: widget.appelsinbruger.Email), SlideDirection.left);
            }, child: Text("Ja Selfølgelig"), style: ElevatedButton.styleFrom(fixedSize:  Size(MediaQuery.of(context).size.width, 22))),
          ),
          Container(
            child: ElevatedButton(onPressed: (){}, child: Text("Nej tak til fordele"),style: ElevatedButton.styleFrom(fixedSize:  Size(MediaQuery.of(context).size.width, 22))
          ))
        ],
      )
      ,)

    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';

import 'package:appelsin/customwidgets/CustomWidgets.dart';

class PriceWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PriceWidget();
}

class _PriceWidget extends State<PriceWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Pris",  textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(
                0xFF392919,
              ) /* primary-dark-brown-dark-brown-100 */,
              fontSize: 20,
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w400,
            )),
      ),
      body: SafeArea(child: Container(
        alignment: Alignment.center,
         child: Column(
           children: [
             Customwidgets.step(0.5,"6", "10"),
             Container(
               width: 402,
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 spacing: 16,
                 children: [
                   Container(
                     width: 354,
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
                     child: Stack(
                       children: [
                         Container(
                           width: 128,
                           height: 128,
                           child: Stack(
                             children: [
                               Positioned(
                                 left: 8,
                                 top: 32,
                                 child: Container(
                                   width: 56,
                                   height: 64,
                                   clipBehavior: Clip.antiAlias,
                                   decoration: BoxDecoration(),
                                   child: Stack(),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           width: 322,
                           child: Text(
                             'Startpakke',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: const Color(0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
                               fontSize: 28,
                               fontFamily: 'Sora',
                               fontWeight: FontWeight.w600,
                               height: 1.29,
                               letterSpacing: -1.12,
                             ),
                           ),
                         ),
                         Container(
                           width: double.infinity,
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             spacing: 4,
                             children: [
                               Text(
                                 '89',
                                 textAlign: TextAlign.right,
                                 style: TextStyle(
                                   color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                   fontSize: 44,
                                   fontFamily: 'Figtree',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               Column(
                                 mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 spacing: 8,
                                 children: [
                                   Text(
                                     'kr. / md.',
                                     textAlign: TextAlign.right,
                                     style: TextStyle(
                                       color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                       fontSize: 20,
                                       fontFamily: 'Figtree',
                                       fontWeight: FontWeight.w400,
                                     ),
                                   ),
                                   Opacity(
                                     opacity: 0,
                                     child: Container(
                                       width: 19,
                                       height: 4,
                                       decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Positioned(
                           left: 9,
                           top: 135.81,
                           child: Container(
                             transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.13),
                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                             clipBehavior: Clip.antiAlias,
                             decoration: BoxDecoration(
                               color: const Color(0xFF29C678) /* secondary-attention-green-attention-green-100 */,
                             ),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               spacing: 10,
                               children: [
                                 Text(
                                   'Mest populær',
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 16,
                                     fontFamily: 'Figtree',
                                     fontWeight: FontWeight.w600,
                                     height: 1.50,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           spacing: 8,
                           children: [
                             SizedBox(
                               width: 322,
                               child: Text(
                                 'Start på det billigste abonnement. Du kan altid opgradere.',
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
                               width: 322,
                               child: Opacity(
                                 opacity: 0.60,
                                 child: Text(
                                   'Inkluderer 10 bilag pr. md.',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                     fontSize: 16,
                                     fontFamily: 'Figtree',
                                     fontWeight: FontWeight.w400,
                                     height: 1.50,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width: 354,
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
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       spacing: 16,
                       children: [
                         Container(
                           width: 128,
                           height: 128,
                           child: Stack(
                             children: [
                               Positioned(
                                 left: 5,
                                 top: 63,
                                 child: Container(
                                   width: 79,
                                   height: 48,
                                   decoration: BoxDecoration(color: const Color(0xFFF9F7F4)),
                                 ),
                               ),
                               Positioned(
                                 left: 0,
                                 top: 48.58,
                                 child: Container(
                                   width: 85,
                                   height: 61.94,
                                   clipBehavior: Clip.antiAlias,
                                   decoration: BoxDecoration(),
                                   child: Stack(),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           width: 322,
                           child: Text(
                             'Vækstkurven',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: const Color(0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
                               fontSize: 28,
                               fontFamily: 'Sora',
                               fontWeight: FontWeight.w600,
                               height: 1.29,
                               letterSpacing: -1.12,
                             ),
                           ),
                         ),
                         Container(
                           width: double.infinity,
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             spacing: 4,
                             children: [
                               Text(
                                 '149',
                                 textAlign: TextAlign.right,
                                 style: TextStyle(
                                   color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                   fontSize: 44,
                                   fontFamily: 'Figtree',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               Column(
                                 mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 spacing: 8,
                                 children: [
                                   Text(
                                     'kr. / mdr.',
                                     textAlign: TextAlign.right,
                                     style: TextStyle(
                                       color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                       fontSize: 20,
                                       fontFamily: 'Figtree',
                                       fontWeight: FontWeight.w400,
                                     ),
                                   ),
                                   Opacity(
                                     opacity: 0,
                                     child: Container(
                                       width: 19,
                                       height: 4,
                                       decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           spacing: 8,
                           children: [
                             SizedBox(
                               width: 322,
                               child: Text(
                                 'Når din virksomhed har voksværk, falder prisen per bilag.',
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
                               width: 322,
                               child: Opacity(
                                 opacity: 0.60,
                                 child: Text(
                                   'Inkluderer 20 bilag pr. md.',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                     fontSize: 16,
                                     fontFamily: 'Figtree',
                                     fontWeight: FontWeight.w400,
                                     height: 1.50,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width: 354,
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
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       spacing: 16,
                       children: [
                         Container(
                           width: 118,
                           height: 128,
                           child: Stack(),
                         ),
                         SizedBox(
                           width: 322,
                           child: Text(
                             'Plantage',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: const Color(0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
                               fontSize: 28,
                               fontFamily: 'Sora',
                               fontWeight: FontWeight.w600,
                               height: 1.29,
                               letterSpacing: -1.12,
                             ),
                           ),
                         ),
                         Container(
                           width: double.infinity,
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             spacing: 4,
                             children: [
                               Text(
                                 '249',
                                 textAlign: TextAlign.right,
                                 style: TextStyle(
                                   color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                   fontSize: 44,
                                   fontFamily: 'Figtree',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               Column(
                                 mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 spacing: 8,
                                 children: [
                                   Text(
                                     'kr. / mdr.',
                                     textAlign: TextAlign.right,
                                     style: TextStyle(
                                       color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                       fontSize: 20,
                                       fontFamily: 'Figtree',
                                       fontWeight: FontWeight.w400,
                                     ),
                                   ),
                                   Opacity(
                                     opacity: 0,
                                     child: Container(
                                       width: 19,
                                       height: 4,
                                       decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           spacing: 8,
                           children: [
                             SizedBox(
                               width: 322,
                               child: Text(
                                 'Voksepakken, når din virksomhed vokser ind i skyerne.',
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
                               width: 322,
                               child: Opacity(
                                 opacity: 0.60,
                                 child: Text(
                                   'Inkluderer 40 bilag pr. md.',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                     fontSize: 16,
                                     fontFamily: 'Figtree',
                                     fontWeight: FontWeight.w400,
                                     height: 1.50,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             )
           ],
         ),
      )),
    );
  }
}
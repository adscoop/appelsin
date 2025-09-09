import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/createbusiess/AddOwnerWidget.dart';
import 'package:appelsin/createbusiess/OwnersWidget.dart';
class CompanyCVRDetailsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompanyCVRDetailsWidget();
}

class _CompanyCVRDetailsWidget extends State<CompanyCVRDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virksomhedsoplysninger',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF392919),
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Customwidgets.step(0.5, "4", "10"),
            Container(
              margin: EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 30),
              child:  Image.asset("assets/images/3x/pos_butik@3x.png")
            ),

            Container(
              width: 370,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F7F4),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color(0xFFEEE3D8),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 338,
                    child: Text(
                      'Har du allerede en virksomhed med CVR-nummer, så indtast det her:',
                      style: TextStyle(
                        color: const Color(0xFF231303),
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVR-nummer',
                        style: TextStyle(
                          color: const Color(0xFF392919),
                          fontSize: 16,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: TextField(
                          controller: editingController,
                          style: TextStyle(
                            color: const Color(0xFF392919),
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Indtast CVR-nummer",
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
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 40),
              child:  ElevatedButton(onPressed: () {
                navigateWithSlide(context, OwnersWidget(),SlideDirection.right);

              }, child: Text("Videre"),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 22)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

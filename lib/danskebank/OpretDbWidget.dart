import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/danskebank/DbSamtyggeWidget.dart';
import 'package:appelsin/danskebank/HarKontoHosDbWidget.dart';
import 'package:appelsin/danskebank/DbTransferTypeWidget.dart';
class Opretdbwidget extends StatefulWidget {
  const Opretdbwidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpretdbwidgetState();
}

enum Group { har_danske, har_ikke_db }

class _OpretdbwidgetState extends State<Opretdbwidget> {
  Group _group = Group.har_danske;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danske Bank"),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(

            children: [
              Customwidgets.step(0.1, "1", "2"),

              const SizedBox(height: 20),

              Image.asset(
                "assets/images/pos_bank@2x.png",
                width: 140,
                height: 150,
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<Group>(
                          value: Group.har_danske,
                          groupValue: _group,
                          onChanged: (Group? value) {
                            setState(() {
                              _group = value!;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "Jeg har en erhvervskonto hos Danske Bank",
                            style: TextStyle(fontSize: 12, fontFamily: 'Sora'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Group>(
                          value: Group.har_ikke_db,
                          groupValue: _group,
                          onChanged: (Group? value) {
                            setState(() {
                              _group = value!;
                            });
                          },

                        ),
                        const Expanded(
                          child: Text(
                            "Jeg har ikke en erhvervskonto hos Danske Bank",
                            style: TextStyle(fontSize: 12 , fontFamily:'Sora'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_group == Group.har_ikke_db) {
                      navigateWithSlide(context, const TransferTypeWidget(), SlideDirection.right);
                    } else {
                      navigateWithSlide(context, const HarKontoHosDbWidget(), SlideDirection.right);
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    ),
                  child: const Text("Videre"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

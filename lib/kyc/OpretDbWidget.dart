import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/apis/AppelsinKycApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/kyc/DbSamtyggeWidget.dart';
import 'package:appelsin/kyc/HarKontoHosDbWidget.dart';
import 'package:appelsin/kyc/DbTransferTypeWidget.dart';
class Opretdbwidget extends StatefulWidget {
  final String email;
  const Opretdbwidget({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpretdbwidgetState();
}

enum Group { har_danske, har_ikke_db }

class _OpretdbwidgetState extends State<Opretdbwidget> {
  late Future<int> user_id;
  late Appelsinapi _appelsinapi;
  late Appelsinkycapi _appelsinkycapi;
  
  @override
  void initState() {
    super.initState();
    _appelsinapi = Appelsinapi();
    _appelsinkycapi = Appelsinkycapi();
    user_id = getBruger();
    
  }
  
  Future<int> getBruger() async {
   final bruger =  await _appelsinapi.getBrugerByEmail(widget.email);
  return await bruger!.id ?? 0;
  }
  
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
                  onPressed: () async {
                    
                    if (_group == Group.har_ikke_db) {
                      final actualUserId = await user_id;
                      navigateWithSlide(context, TransferTypeWidget(user_id: actualUserId), SlideDirection.right);
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

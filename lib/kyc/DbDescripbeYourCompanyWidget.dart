import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/kyc/CompanyDetalisWidget.dart';
class DbDescripbeYourCompanyWidget extends StatefulWidget {

  const DbDescripbeYourCompanyWidget({Key? key}) : super(key: key);

  @override
  _DbDescripbeYourCompanyWidget createState() => _DbDescripbeYourCompanyWidget();

}

class _DbDescripbeYourCompanyWidget extends State<DbDescripbeYourCompanyWidget> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("Beskriv kort dit firma"),
  ),
  body: SafeArea(child: Container(margin: 
    EdgeInsets.only(left: 16, right:  16), 
    child: Column(
      children: [
        Container(
          child:Customwidgets.step(0.3, "8", "10") ,
        ),
        TextField(
          minLines: 2,
          maxLines: 2,
        ),
        Spacer(),
        Container(
          child: ElevatedButton(onPressed: (){

            navigateWithSlide(context, CompanyDetailsWidget(), SlideDirection.left);
          }, child: Text("Videre"),
              style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 48),
  )
          ),
        )
      ],
    ),
    )),
);
  
  }
}
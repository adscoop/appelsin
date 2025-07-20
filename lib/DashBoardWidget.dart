import 'package:appelsin/LandingPageViewWidget.dart';
import 'package:appelsin/bank/IncomeWidget.dart';
import 'package:appelsin/bank/OutComeWidget.dart';
import 'package:appelsin/offer/OfferWidget.dart';
import 'package:flutter/material.dart';

class Dashboardwidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState()  => _Dashboardwidget();
}

class _Dashboardwidget extends State<Dashboardwidget> {
  int currentPageIndex = 0;
  @override
    Widget build(BuildContext context) {
    return   Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: _bottamNavigationBar(),
    );

  }
  List<Widget> get pages => <Widget>[
    Landingpageviewwidget(),
IncomeWidget(),
    Outcomewidget(),
    Offerwidget()
  ];

  Widget _bottamNavigationBar() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 50),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(40), // Stadium effect
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 0, ""),
          _buildNavItem(Icons.opacity_rounded, 1, ""),
          _buildNavItem(Icons.abc, 2, ""),
          _buildNavItem(Icons.local_offer, 3, ""),
        ],
      ),
    );
  }



  Widget _buildNavItem(IconData icon, int index, String label) {
    final isSelected = currentPageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentPageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: isSelected
            ? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
              color: isSelected ? Colors.orange : Colors.white,
            )

          ],
        ),
      ),
    );
  }


  void modal() {
        showModalBottomSheet(context: context, builder: (BuildContext contest)  {
          return SizedBox(
            width: 400,
             child: Text(""),
          );
        });
    }
}
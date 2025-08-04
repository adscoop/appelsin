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
    LandingPageViewWidget(),
IncomeWidget(),
    Outcomewidget(),
    Offerwidget()
  ];

  Widget _bottamNavigationBar() {
    return Container(
        height: 100,
        padding: const EdgeInsets.only(bottom: 0, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.lightBlue,
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
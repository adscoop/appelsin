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
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );

  }
  List<Widget> get pages => <Widget>[
    LandingPageViewWidget(),
IncomeWidget(),
    Outcomewidget(),
    Offerwidget()
  ];

  Widget _bottomNavigationBar() {
    return SafeArea(
      top: false,
      child: Padding(
        // Margin from the bottom and sides
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Material(
          color: Colors.blue,
          elevation: 8,
          shape: const StadiumBorder(),
          clipBehavior: Clip.antiAlias,
          child: Theme(
            // Make sure the stadium Material color is visible
            data: Theme.of(context).copyWith(
              splashColor: Colors.yellow,
              highlightColor: Colors.red,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPageIndex,
              onTap: (index) => setState(() => currentPageIndex = index),
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.blue.shade900,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Overblik',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.opacity_rounded),
                  label: 'Indtægter',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: 'Udgifter',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer),
                  label: 'Tilbud',
                ),
              ],
            ),
          ),
        ),
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
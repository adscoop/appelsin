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

  ];

    Widget _bottamNavigationBar() {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13),
       decoration: BoxDecoration(
         color: Colors.blue[100],

         borderRadius:  BorderRadius.circular(10)
       ),
        alignment: Alignment.bottomCenter,
    child: NavigationBar(destinations: [
      _buildNavItem(Icons.home, 0 , "start")
    ] ));
    }

  Widget _buildNavItem(IconData icon, int index, String label) {
    final isSelected = currentPageIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPageIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 17, color: isSelected ? Colors.orangeAccent[300] : Colors.black),
          Text(label, style: TextStyle(fontSize: 8, color: isSelected ? Colors.orangeAccent[400] : Colors.black)),
        ],
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
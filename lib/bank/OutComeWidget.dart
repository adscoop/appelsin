
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Outcomewidget extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _Outcomewidget();

}

class _Outcomewidget extends State<Outcomewidget> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.redAccent[300],
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text('Udgifter')),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.orange.shade50),
                ),
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 9),
                isScrollable: false,
                labelPadding: EdgeInsets.symmetric(horizontal: 16),
                tabs: const [
                  Tab(text: 'Alle'),
                  Tab(text: 'Ubetalte'),
                  Tab(text: 'Rykker'),
                  Tab(text: 'Betalte'),
                  Tab(text: 'Kladder'),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _incomeTab("Alle"),
                  _incomeTab("Ubetalte"),
                  _incomeTab("Rykker"),
                  _incomeTab("Betalte"),
                  _incomeTab("Kladder"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(

                onPressed: () {
                  // Håndter opret ny regning
                },
                child: Text("Opret ny regning"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _incomeTab(String label) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Text("Indhold for: $label",style:  TextStyle(fontSize: 9),),
    );
  }
}

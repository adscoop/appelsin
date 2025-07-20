import 'package:flutter/material.dart';

class IncomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.redAccent[300],
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text('Indtægter')),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
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
                  border: Border.all(color: Colors.white),
                ),
                labelColor: Colors.orange,

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
                child: Text("Opret faktura"),
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

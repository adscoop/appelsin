import 'package:flutter/material.dart';

class LandingPageViewWidget extends StatefulWidget {
  @override
  State<LandingPageViewWidget> createState() => _LandingPageViewWidgetState();
}

class _LandingPageViewWidgetState extends State<LandingPageViewWidget> {
  final String currentBalance = "28.123";
  final String futureBalanceDate = "31. juli 2025";
  final String expectedBalance = "36.570";
  final String expenses = "-5666";
  final String income = "4555";

  bool showTransactions = false;

  final List<String> transactions = [
    "Netflix -129 kr",
    "Løn +25.000 kr",
    "SuperBrugsen -320 kr",
    "Elregning -740 kr",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.orange),
            onPressed: () {
              print("Profil ikon trykket");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              currentBalance,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Text("En regning mangler at blive betalt"),
            ),
            SizedBox(height: 30),
            Chip(
              label: Text("Transaktioner", style: TextStyle(color: Colors.orange)),
              backgroundColor: Colors.orange.shade100,
              shape: StadiumBorder(),
            ),

            Container(
              constraints: BoxConstraints(
                minHeight: 200,
                maxHeight: showTransactions ? 1000 : 330, // optionally allow grow
              ),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Forventet fremtidige saldo", style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Text(futureBalanceDate, style: TextStyle(color: Colors.orange.shade800)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      expectedBalance,
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Udgifter"),
                            Spacer(),
                            Text(expenses, style: TextStyle(color: Colors.red.shade900)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Indtægter"),
                            Spacer(),
                            Text(income, style: TextStyle(color: Colors.green.shade800)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showTransactions = !showTransactions;
                                });
                              },
                              child: Text(
                                showTransactions ? "Skjul detaljer" : "Vis detaljer",
                                style: TextStyle(
                                  color: Colors.orange.shade800,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                print("Justere udregning trykket");
                              },
                              child: Text(
                                "Justere udregning",
                                style: TextStyle(
                                  color: Colors.orange.shade800,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (showTransactions) ...[
                          Divider(),
                          Text("Udgifter"),
                          SizedBox(height: 10),

                          ListView.builder(
                            itemCount: transactions.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                leading: Icon(Icons.arrow_right, color: Colors.orange),
                                title: Text(transactions[index]),
                              );
                            },
                          ),
                          Divider(),
                          Text("Indtægter")
                        ],
                      ],
                    )
                    ),

                ],
              ),
            ),


            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

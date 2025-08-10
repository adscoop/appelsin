import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateCustomerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  String? _selectedCountry;

  // Brug separate controllere for hvert felt
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cvrController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<String> _countries = [
    'Denmark', 'Germany', 'Sweden', 'Norway',
    'Finland', 'France', 'United Kingdom',
    'United States', 'India', 'China',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opret kunde", style: TextStyle(fontWeight: FontWeight.w400)),
          bottom: TabBar(
            tabs: [

              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                child: Text('Erhverv'),
              ),
              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                child: Text('Privat'),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            createCompanyUser(),
            createPrivateUser(),
          ],
        ),
      ),
    );
  }

  Widget createPrivateUser() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          label("Land"),
          dropdownCountry(),
          label("Navn"),
          textField(nameController),
          label("CVR"),
          textField(cvrController),
          label("Adresse"),
          label("Vejnavn"),
          textField(streetController),
          label("Nummer"),
          textField(numberController),
          label("Postnummer"),
          textField(zipController),
          label("Email"),
          textField(emailController),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Håndter oprettelse
            },
            child: Text("Opret kunde"),
          ),
        ],
      ),
    );
  }

  Widget createCompanyUser() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          label("Land"),
          dropdownCountry(),
          label("Firna navn"),
          textField(nameController),
          label("CVR"),
          textField(cvrController),
          label("Adresse"),
          label("Vejnavn"),
          textField(streetController),
          label("Nummer"),
          textField(numberController),
          label("Postnummer"),
          textField(zipController),
          label("Email"),
          textField(emailController),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Håndter oprettelse
            },
            child: Text("Opret kunde"),
          ),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget textField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget dropdownCountry() {
    return DropdownButtonFormField<String>(
      value: _selectedCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      items: _countries.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(country, style: TextStyle(fontSize: 14)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCountry = value;
        });
      },
    );
  }
}

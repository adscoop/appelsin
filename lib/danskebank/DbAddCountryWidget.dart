import 'package:flutter/material.dart';

class DbAddCountryWidget extends StatefulWidget {
  final Function(List<String>) lande;
  const DbAddCountryWidget({Key? key, required this.lande}) : super(key: key);

  @override
  _DbAddCountryWidgetState createState() => _DbAddCountryWidgetState();
}

class _DbAddCountryWidgetState extends State<DbAddCountryWidget> {

  List<String> countries = ["Danmark", "Norge", "Sverige", "Finland", "Tyskland", "Holland", "Belgien", "Frankrig"];
  List<String> newCountries = List.empty(growable: true);
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tilføj Land"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 370,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F7FF), // light blue background
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFCCDDFE), // border color
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.grey[600]),
                    const SizedBox(width: 10), // replaces spacing
                    Expanded(
                      child: TextField(
                        controller: editingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Søg efter land",
                          hintStyle: TextStyle(
                            color: const Color(0xFF392919).withOpacity(0.35),
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.flag),
                    title: Text(
                      countries[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                  newCountries.add(countries[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("You tapped ${countries[index]}")),
                      );
                    },
                  );
                },
              )),
              Container(
                child: ElevatedButton(onPressed: () => {
                  widget.lande(newCountries)
                }, child: Text("Gem valg")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

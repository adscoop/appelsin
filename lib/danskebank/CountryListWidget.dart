import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/danskebank/DbAddCountryWidget.dart';

class CountryListWidget extends StatefulWidget {
  final Function(List<String>) lande; // callback to parent

  const CountryListWidget({Key? key, required this.lande}) : super(key: key);

  @override
  _CountryListWidgetState createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  String? selectedCountry; // store which one is selected

  List<String> countries = ["Danmark", "Tyskland", "Belgien"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Button to add new country
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              navigateWithSlide(
                context,
                DbAddCountryWidget(
                  lande: (newCountries) {
                    setState(() {
                      countries.addAll(newCountries);
                      print(countries);
                      print(newCountries);
                    });
                    // also send updated list back to parent
                    widget.lande(newCountries);
                  },
                ),
                SlideDirection.up,
              );
            },
            child: const Text("Tilføj land"),
          ),
        ),

        // The country list box
        Container(
          width: 370,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color(0xFFF9F7F4),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFEEE3D8)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: countries.map((country) {
              final isSelected = selectedCountry == country;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCountry = country;
                  });
                  // send selected back to parent if you want
                  widget.lande([country]);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: isSelected ? Colors.blue[50] : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: isSelected ? Colors.blue : const Color(0xFFEEE3D8),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    country,
                    style: TextStyle(
                      color: isSelected ? Colors.blue[900] : const Color(0xFF392919),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.71,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

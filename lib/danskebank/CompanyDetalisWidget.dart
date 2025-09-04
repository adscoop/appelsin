import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/danskebank/CompanyDetailStepTwoWidget.dart';
class CompanyDetailsWidget extends StatefulWidget {
  const CompanyDetailsWidget({super.key});

  @override
  State<CompanyDetailsWidget> createState() => _CompanyDetailsWidget();
}

class _CompanyDetailsWidget extends State<CompanyDetailsWidget> {
  // Single selection for products/services
  final List<String> produkter = ["Produkter", "Services"];
  String selectedProd = "";

  // Multi-selection for contact with customers
  final List<String> kontaktMedKunder = ["Fysisk", "Online", "Øvrige"];
  final Set<String> selectedKontakt = {};

  // Multi-selection for customer types
  final List<String> kundeTyper = [
    "Privat",
    "Erhverv",
    "Offentligt",
    "Fonde",
    "Foreninger",
    "Øvrige"
  ];
  final Set<String> selectedKundeTyper = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Virksomhedsdetaljer")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSection(
                title: "Sælger din virksomhed produkter og/eller services?",
                child: _buildTwoPerRowChoiceChips(
                  items: produkter,
                  selectedItems: [selectedProd],
                  singleSelection: true,
                  onSelected: (item, selected) {
                    setState(() {
                      selectedProd = selected ? item : "";
                    });
                  },
                ),
              ),
              _buildSection(
                title: "Hvilken kontakt har selskabet med sine kunder?",
                child: _buildTwoPerRowChoiceChips(
                  items: kontaktMedKunder,
                  selectedItems: selectedKontakt.toList(),
                  singleSelection: false,
                  onSelected: (item, selected) {
                    setState(() {
                      if (selected) {
                        selectedKontakt.add(item);
                      } else {
                        selectedKontakt.remove(item);
                      }
                    });
                  },
                ),
              ),
              _buildSection(
                title: "Hvilken type kunder har virksomheden?",
                child: _buildTwoPerRowChoiceChips(
                  items: kundeTyper,
                  selectedItems: selectedKundeTyper.toList(),
                  singleSelection: false,
                  onSelected: (item, selected) {
                    setState(() {
                      if (selected) {
                        selectedKundeTyper.add(item);
                      } else {
                        selectedKundeTyper.remove(item);
                      }
                    });
                  },
                ),
              ),
              _buildSection(
                title: "Virksomhedens skattepligt",
                child: const SizedBox.shrink(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    navigateWithSlide(context, CompanyDetailStepTwoWidget(), SlideDirection.down);
                  },
                  child: const Text("Videre"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Section container with consistent style
  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F7F4),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFEEE3D8),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // Helper: Build ChoiceChips 2 per row
  Widget _buildTwoPerRowChoiceChips({
    required List<String> items,
    required List<String> selectedItems,
    required bool singleSelection,
    required Function(String item, bool selected) onSelected,
  }) {
    return Column(
      children: List.generate(
        (items.length / 2).ceil(),
            (rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                ChoiceChip(
                  backgroundColor: Colors.white,
                  color: WidgetStatePropertyAll(Colors.white),
                  label: Text(items[firstIndex], style: TextStyle(fontFamily: 'Sora', fontSize: 10),),
                  selected: selectedItems.contains(items[firstIndex]),
                  onSelected: (selected) {
                    if (singleSelection) {
                      onSelected(items[firstIndex], selected);
                    } else {
                      onSelected(items[firstIndex], selected);
                    }
                  },
                ),
                const SizedBox(width: 8),
                if (secondIndex < items.length)
                  ChoiceChip(
                    backgroundColor: Colors.white,

                    label: Text(items[secondIndex], style: TextStyle(fontFamily: 'Sora', fontSize: 10),),
                    selected: selectedItems.contains(items[secondIndex]),
                    onSelected: (selected) {
                      if (singleSelection) {
                        onSelected(items[secondIndex], selected);
                      } else {
                        onSelected(items[secondIndex], selected);
                      }
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

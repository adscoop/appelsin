import 'package:appelsin/apis/AppelsinKycApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Kyc.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/kyc/CompanyDetailStepTwoWidget.dart';
import 'dart:convert';
class CompanyDetailsWidget extends StatefulWidget {
  final Appelsinbruger appelsinbruger;
  const CompanyDetailsWidget({Key? key, required this.appelsinbruger}):super(key: key);

  @override
  State<CompanyDetailsWidget> createState() => _CompanyDetailsWidget();
}

class _CompanyDetailsWidget extends State<CompanyDetailsWidget> {
  
late Appelsinkycapi _appelsinkycapi;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appelsinkycapi = Appelsinkycapi();
  }
  // Single selection for products/services
  final List<String> produkter = ["Produkter", "Services"];
  String selectedProd = "";

  // Multi-selection for contact with customers
  final List<String> kontaktMedKunder = ["Fysisk", "Online", "Øvrige"];
   Set<String> selectedKontakt = {};

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
final Set<String> allSelected = {};

  // Single-selection SegmentedButton for tax liability
  // Values are stable keys; labels are the user-facing Danish texts.
  final List<ButtonSegment<String>> _taxSegments = const [
    ButtonSegment<String>(value: 'full', label: Text('Fuldt skattepligtig')),
    ButtonSegment<String>(value: 'limited', label: Text('Begrænset skattepligt')),
  ];
  Set<String> _selectedTax = {'full'}; // default selection; change to {} to require explicit choice
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
                child: SegmentedButton<String>(
                  segments: _taxSegments,
                  selected: _selectedTax,
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _selectedTax = newSelection;
                    });
                  },
                  multiSelectionEnabled: false,
                  emptySelectionAllowed: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    addKyc();
                    navigateWithSlide(context, CompanyDetailStepTwoWidget(appelsinbruger: widget.appelsinbruger,), SlideDirection.down);
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

Future<void> addKyc() async {
  // Build a flat, unique list of selections
  final selections = <String>[
    if (selectedProd.isNotEmpty) selectedProd,
    ...selectedKontakt,        // Set<String> -> spreads fine
    ...selectedKundeTyper,     // Set<String> -> spreads fine
    // Include tax liability choice (human-readable)
    if (_selectedTax.isNotEmpty)
      (_selectedTax.first == 'full' ? 'Fuldt skattepligtig' : 'Begrænset skattepligt'),
  ];

  // If you need uniqueness, enforce it then back to list
  final uniqueSelections = selections.toSet().toList();

  final kyc = Kyc(
    appelsinBrugerId: widget.appelsinbruger.id!,
    linje: jsonEncode(uniqueSelections), // ✅ List -> encodable
    isDone: true,
    step: 'company details',
  );

  // Optionally send it
  await _appelsinkycapi.createKyc(kyc,widget.appelsinbruger.id!);
}

}

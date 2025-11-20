import 'dart:convert';

import 'package:appelsin/apis/CompaniesApi.dart';
import 'package:appelsin/apis/OwnersApi.dart';
import 'package:appelsin/models/Address.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Companies.dart';
import 'package:appelsin/models/Owners.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/createbusiess/AddOwnerWidget.dart';
import 'package:appelsin/models/OwnerDTO.dart';
import 'package:appelsin/price/PriceWidget.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';

class OwnersWidget extends StatefulWidget {
  final Appelsinbruger appelsinbruger;

  const OwnersWidget({Key? key, required this.appelsinbruger}): super(key: key);
  @override
  State<StatefulWidget> createState() => _OwnersWidget();
}

class _OwnersWidget extends State<OwnersWidget> {
  // Dynamisk datakilde til liste af ejere
  final List<OwnerDTO> _owners = <OwnerDTO>[]; // growable
late Ownersapi _ownersapi;

late CompaniesApi _companiesApi;
// Company data is loaded async; keep it nullable to avoid late-init crashes
Companies? _company;
bool _companyLoading = true;
String? _companyError;
  @override
  void initState() {
    super.initState();
    _ownersapi = Ownersapi();
    _companiesApi = CompaniesApi();
    loadCompany();
    addPrimaryOwnerToList();


  }

  Future<void> addPrimaryOwnerToList() async {
    // Use Danish labels to align with dropdown items in AddOwnerWidget
    OwnerDTO ownerDTO = OwnerDTO(
        fornavn: widget.appelsinbruger.FirstName!,
        efternavn: widget.appelsinbruger.LastName!,
        ejerandel: 100,
        telefonnummer: widget.appelsinbruger.PhoneNumber!,
        rolle: "Direktær",
        statsborgerskab: "Danmark",
        skattepligt: "Danmark",
        erAndrePep: false,
        erDuPep: false,
        erKontaktPerson: true);

    setState(() {
      _owners.add(ownerDTO);
        });

  }
  Future<void> loadCompany() async {
    print("load company");
    setState(() {
      _companyLoading = true;
      _companyError = null;
    });
    try {
      print(widget.appelsinbruger.id);
      final c = await _companiesApi.getCompanyByUserId(widget.appelsinbruger.id!);
      setState(() {
        _company = c;
        _companyLoading = false;
      });
    } catch (e) {
      setState(() {
        _companyLoading = false;
        _companyError = e.toString();
        _company = null;
      });
    }
  }
  // Bygger et kort/Container for en ejer
  Widget _ownerCard(OwnerDTO owner) {
    // Marker ejer hvis CVR mangler
    final bool _missingCvr = (() {
      try {
        // Support both nullable and non-nullable String definitions
        // ignore: unnecessary_null_comparison
        final cpr = (owner.cpr as String?);
        return cpr == null || cpr.trim().isEmpty;
      } catch (_) {
        // If OwnerDTO doesn't have cvr or type differs, treat as not missing
        return false;
      }
    })();
    // Marker ejer hvis adresse mangler (by, vej/nummer eller postnummer)
    final bool _missingAddress = (() {
      try {
        final city = (owner.city as String?);
        final streetNo = (owner.vejnavn_nummer as String?);
        final zip = (owner.postnummer as String?);
        bool isEmpty(String? s) => s == null || s.trim().isEmpty;
        return isEmpty(city) || isEmpty(streetNo) || isEmpty(zip);
      } catch (_) {
        // Hvis felterne ikke findes, antag ingen fejl for at undgå falske positive
        return false;
      }
    })();
    final bool _hasIssue = _missingCvr || _missingAddress;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: _hasIssue
            ? const Color(0xFFFFF4F4) // svag rød baggrund når CVR mangler
            : const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: _hasIssue
                ? Colors.redAccent
                : const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tekstkolonne
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner.fornavn,
                  style: TextStyle(
                    color: Color(
                      0xFF231303,
                    ) /* primary-dark-brown-dark-brown-200 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  owner.ejerandel.toString(),
                  style: TextStyle(
                    color: const Color(
                      0xFF392919,
                    ) /* primary-dark-brown-dark-brown-100 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
                if (_missingCvr) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.error_outline, color: Colors.redAccent, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Mangler CPR',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
                if (_missingAddress) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.error_outline, color: Colors.redAccent, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Mangler adresse',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: 12),
          // Placeholder-ikoner/håndtag
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _owners.remove(owner);
                    });
                  },
                  child: Icon(Icons.delete_forever_outlined),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: GestureDetector(
                  onTap: () {
                    final index = _owners.indexOf(owner);
                    if (index == -1) return;
                    navigateWithSlide(
                      context,
                      AddOwnerWidget(
                        call: addElementToList,
                        initialOwner: owner,
                        ownerIndex: index,
                        onUpdate: updateOwnerAt,
                      ),
                      SlideDirection.right,
                    );
                  },
                  child: Icon(Icons.edit),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejerforhold',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(
              0xFF392919,
            ) /* primary-dark-brown-dark-brown-100 */,
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Customwidgets.step(0.3, "5", "10"),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 30),
                child: Text(
                  'Alle ejere ud over dig selv, som ejer 25% eller mere af virksomheden, skal angives her.',
                  style: TextStyle(
                    color: const Color(
                      0xFF392919,
                    ) /* primary-dark-brown-dark-brown-100 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ),
              // ... existing code ...
              // Dynamisk liste over ejere
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                  itemCount: _owners.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final owner = _owners[index];
                    return _ownerCard(owner);
                  },
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    navigateWithSlide(
                      context,
                      AddOwnerWidget(call: addElementToList),
                      SlideDirection.right,
                    );
                  },
                  child: Text(
                    "Tilføj ejer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(
                        0xFF392919,
                      ) /* primary-dark-brown-dark-brown-100 */,
                      fontSize: 16,
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF9F7F4),
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 16, right: 1),
                child: ElevatedButton(
                  onPressed: _submitting ? null : _submitOwnersAndProceed,
                  child: Text("Videre"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 22),
                  ),
                ),
              ),
              // ... existing code ...
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addElementToList(OwnerDTO value) async {
    // Only add locally. Persist when pressing "Videre".
    setState(() {
      _owners.add(value);
    });
  }

  bool _submitting = false;

  // Helpers for safe parsing
  int _toInt(String? s, {int defaultValue = 0}) {
    final v = (s ?? '').trim();
    if (v.isEmpty) return defaultValue;
    final m = RegExp(r'^(\d+)').firstMatch(v);
    if (m != null) return int.tryParse(m.group(1)!) ?? defaultValue;
    return int.tryParse(v) ?? defaultValue;
  }

  int _digitsToInt(String? s, {int defaultValue = 0}) {
    final digits = (s ?? '').replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return defaultValue;
    return int.tryParse(digits) ?? defaultValue;
  }

  Future<void> _submitOwnersAndProceed() async {
    if (_submitting) return;
    setState(() {
      _submitting = true;
    });
    try {
      loadCompany();
      // Ensure company is available before persisting
      Companies? c = _company;
      if (c == null) {
        if (_companyLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Henter virksomhedsdata... Prøv igen om et øjeblik.')),
          );
          return;
        }
        await loadCompany();
        c = _company;
        if (c == null) {
          final msg = _companyError == null
              ? 'Kunne ikke hente virksomhedsdata. Prøv igen senere.'
              : 'Fejl ved hentning af virksomhed: $_companyError';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg)),
          );
          return;
        }
      }

      // Persist each owner
      for (final value in _owners) {
        final addresse = Address(
          bynavn: value.city,
          husnummerFra: _toInt(value.vejnavn_nummer),
          postnummer: _toInt(value.postnummer),
        );
        final owners = Owners(
          efternavn: value.efternavn,
          fornavn: value.fornavn,
          ejerandle: value.ejerandel,
          erpep: value.erDuPep,
          rolle: value.rolle,
          telefon: value.telefonnummer,
          er_kontaktpersom: value.erKontaktPerson,
          addresse: jsonEncode(addresse),
          cpr: _digitsToInt(value.cpr),
          skattepligt: value.skattepligt,
          statsborge: value.statsborgerskab,
          cvr_id: c.id,
        );
        await _ownersapi.create(owners);
      }

      // Navigate forward after successful save
      navigateWithSlide(
        context,
        PriceWidget(appelsinbruger: widget.appelsinbruger),
        SlideDirection.left,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kunne ikke gemme ejere: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  Future<void> updateOwnerAt(int index, OwnerDTO updated) async {
    // TODO: If backend supports update, call it here similar to create()
    // e.g., await _ownersapi.update(...)
    if (index < 0 || index >= _owners.length) return;
    setState(() {
      _owners[index] = updated;
    });
  }

  Future<void> populate() async {
    setState(() {});
  }
}

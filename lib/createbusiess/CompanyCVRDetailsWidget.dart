import 'dart:async';
import 'package:appelsin/apis/CompaniesApi.dart';
import 'package:appelsin/models/Address.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Companies.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/createbusiess/AddOwnerWidget.dart';
import 'package:appelsin/createbusiess/OwnersWidget.dart';
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/models/CvrLocalSearch.dart';
import 'dart:convert';
class CompanyCVRDetailsWidget extends StatefulWidget {
  final Appelsinbruger appelsinbruger;

  const CompanyCVRDetailsWidget({Key? key, required this.appelsinbruger}): super(key: key);
  @override
  State<StatefulWidget> createState() => _CompanyCVRDetailsWidget();
}

class _CompanyCVRDetailsWidget extends State<CompanyCVRDetailsWidget> {
  // Local-search state
  final _api = Appelsinapi();
  final _companyApi = CompaniesApi();
  Timer? _debounce;
  bool _isLoading = false;
  String? _error;
  List<CvrLocalSearchItem> _items = const [];
  // Pagination state
  int _page = 1;
  int _pageSize = 5;
  int _total = 0;

  // Text controller for input
  late final TextEditingController _editingController;
  bool _hideSuggestions = false;
  CvrLocalSearchItem? _selectedItem;

  @override
  void initState() {
    super.initState();

    _editingController = TextEditingController();
    _editingController.addListener(() {
      final text = _editingController.text.trim();
      // Rebuild so visibility logic that depends on query runs
      setState(() {
        if (_hideSuggestions) _hideSuggestions = false;
        // If user edits after selecting, clear the selection so address hides
        if (_selectedItem != null && text != _selectedItem!.name && text != _selectedItem!.id) {
          _selectedItem = null;
        }
      });
      _onQueryChanged(text);
    });
  }

  void _onQueryChanged(String q) {
    _debounce?.cancel();
    if (q.isEmpty) {
      setState(() {
        _items = const [];
        _error = null;
        _isLoading = false;
        _total = 0;
        _page = 1;
      });
      return;
    }
    // Reset to first page on query change
    _page = 1;
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      await _performSearch(q, page: _page, pageSize: _pageSize);
    });
  }

  Future<void> _performSearch(String q, {required int page, required int pageSize}) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final res = await _api.getLocalSearchByKey(q, page: page, pageSize: pageSize);
      setState(() {
        _items = res.items;
        _total = res.total;
        _page = res.page; // backend authoritative
        _pageSize = res.pageSize;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _items = const [];
        _total = 0;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _editingController.dispose();
    super.dispose();
  }

  int get _totalPages {
    if (_pageSize <= 0) return 1;
    final pages = (_total + _pageSize - 1) ~/ _pageSize;
    return pages == 0 ? 1 : pages;
  }

  Future<void> _goToPage(int newPage) async {
    final q = _editingController.text.trim();
    if (q.isEmpty) return;
    if (newPage < 1) newPage = 1;
    final maxPage = _totalPages;
    if (newPage > maxPage) newPage = maxPage;
    setState(() {
      _page = newPage;
    });
    await _performSearch(q, page: _page, pageSize: _pageSize);
  }

  Future<void> _changePageSize(int newSize) async {
    if (newSize == _pageSize) return;
    final q = _editingController.text.trim();
    setState(() {
      _pageSize = newSize;
      _page = 1;
    });
    if (q.isEmpty) return;
    await _performSearch(q, page: _page, pageSize: _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virksomhedsoplysninger',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF392919),
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            children: [
            Customwidgets.step(0.5, "4", "10"),
            Container(
              margin: EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 30),
              child:  Image.asset("assets/images/3x/pos_butik@3x.png")
            ),

            Container(
              width: 370,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F7F4),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color(0xFFEEE3D8),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 338,
                    child: Text(
                      'Har du allerede en virksomhed med CVR-nummer, så indtast det her:',
                      style: TextStyle(
                        color: const Color(0xFF231303),
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'CVR-nummer',
                    style: TextStyle(
                      color: const Color(0xFF392919),
                      fontSize: 16,
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _editingController,
                      style: TextStyle(
                        color: const Color(0xFF392919),
                        fontSize: 16,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Indtast CVR-nummer",
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                  // Suggestions list
                  SizedBox(height: 8),
                  _buildSuggestionsList(),
                  SizedBox(height: 8),
                  _buildSelectedAddressCard(),
                ],
              ),
            ),
            // Avoid forcing the button beyond the visible area; wrap in SafeArea
            // and remove rigid Spacer to prevent overflow when keyboard is visible.
            SafeArea(
              top: false,
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child:  ElevatedButton(
                  onPressed: () {
                    createCompany();
                    navigateWithSlide(context, OwnersWidget(appelsinbruger:  widget.appelsinbruger,),SlideDirection.right);
                  },
                  child: Text("Videre"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildSuggestionsList() {
    final query = _editingController.text.trim();
    if (_hideSuggestions || query.isEmpty) {
      return SizedBox.shrink();
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 300,
        minWidth: 3
      ),
      child: Builder(builder: (context) {
        if (_isLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        if (_error != null) {
          debugPrint(_error);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Fejl ved søgning', style: TextStyle(color: Colors.red)),
          );
        }
        if (_items.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Ingen resultater'),
          );
        }
        final listWidget = Material(
          color: Colors.transparent,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _items.length,
            separatorBuilder: (_, __) => Divider(height: 1, color: Color(0xFFEEE3D8)),
            itemBuilder: (context, index) {
              final it = _items[index];
              final title = (it.name.isNotEmpty ? it.name : it.id);
              final subtitleParts = <String>[];
              if (it.id.isNotEmpty) subtitleParts.add(it.id);
              if (it.score > 0) subtitleParts.add('score ${it.score.toStringAsFixed(5)}');
              final subtitleText = subtitleParts.join(' · ');
              return ListTile(
                dense: true,
                title: Text(it.name.isNotEmpty ? it.name : it.businessKeys.first.key , style: TextStyle(fontSize: 14, color: const Color(0xFF392919))),
                onTap: () {
                  // Store selection and fill input with CVR id
                  setState(() {
                    _selectedItem = it;
                    _editingController.text = it.name;
                    _hideSuggestions = true;
                  });
                },
              );
            },
          ),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Use Flexible instead of Expanded to avoid tight constraints within
            // a ConstrainedBox when keyboard or layout reduces available height.
            Flexible(child: listWidget, fit: FlexFit.loose),
            SizedBox(height: 8),
            _buildPaginationControls(),
          ],
        );
      }),
    );
  }

  Widget _buildPaginationControls() {
    final isDisabled = _isLoading || _editingController.text.trim().isEmpty;
    final current = _page;
    final totalPages = _totalPages;

    return Container
    (
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F7F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Prev
          IconButton(
            tooltip: 'Forrige',
            onPressed: (!isDisabled && current > 1)
                ? () => _goToPage(current - 1)
                : null,
            icon: const Icon(Icons.chevron_left),
          ),
          // Page indicator
          Text(
            'Side $current af $totalPages',
            style: const TextStyle(fontSize: 12, color: Color(0xFF392919)),
          ),
          // Next
          IconButton(
            tooltip: 'Næste',
            onPressed: (!isDisabled && current < totalPages)
                ? () => _goToPage(current + 1)
                : null,
            icon: const Icon(Icons.chevron_right),
          ),
          const Spacer(),
          // Page size selector
          const Text('Pr. side:', style: TextStyle(fontSize: 12, color: Color(0xFF6B5E52))),
          const SizedBox(width: 8),
          DropdownButton<int>(
            value: _pageSize,
            onChanged: isDisabled
                ? null
                : (v) {
                    if (v != null) _changePageSize(v);
                  },
            items: const [5, 10, 20]
                .map((n) => DropdownMenuItem(
                      value: n,
                      child: Text('$n'),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedAddressCard() {
    final it = _selectedItem;
    if (it == null) return SizedBox.shrink();

    // Prefer nicely formatted address; fallback to composing from fields.
    String address = it.formattedAddress ?? '';
    if (address.isEmpty && it.adresse != null) {
      final a = it.adresse!;
      final parts = <String>[];
      if (a.vejnavn.isNotEmpty) {
        final hus = [a.husnummerFra, if (a.husnummerTil != null && a.husnummerTil!.isNotEmpty) '-${a.husnummerTil!}']
            .where((e) => e != null && e.toString().isNotEmpty)
            .join('');
        parts.add('${a.vejnavn}${hus.isNotEmpty ? ' $hus' : ''}');
      }
      final line2 = [if (a.postnummer.isNotEmpty) a.postnummer, if (a.postdistrikt.isNotEmpty) a.postdistrikt]
          .where((s) => s.toString().trim().isNotEmpty)
          .join(' ');
      if (a.supplerendeBynavn != null && a.supplerendeBynavn!.isNotEmpty) {
        parts.add(a.supplerendeBynavn!);
      }
      if (line2.isNotEmpty) parts.add(line2);
      address = parts.join(', ');
    }

    return Container(
      // Fill available width; parent padding/constraints will limit it.
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F7F4),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFEEE3D8),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on_outlined, color: Color(0xFF6B5E52)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  it.name.isNotEmpty ? it.name : it.id,
                  style: const TextStyle(
                    color: Color(0xFF392919),
                    fontSize: 14,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'CVR: ${it.businessKeys.first.key}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF6B5E52)),
                ),
                const SizedBox(height: 4),
                if (address.isNotEmpty)
                  Text(
                    address,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF392919)),
                  )
                else
                  const Text(
                    'Ingen adresse fundet for valgt resultat',
                    style: TextStyle(fontSize: 12, color: Color(0xFF6B5E52)),
                  ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedItem = null;
                        _hideSuggestions = false;
                      });
                      final q = _editingController.text.trim();
                      if (q.isNotEmpty) {
                        _performSearch(q, page: _page, pageSize: _pageSize);
                      }
                    },
                    child: const Text('Skift valg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Future<void> createCompany() async {

    final a = _selectedItem?.adresse;
    Address ad = Address(
      bynavn: a?.supplerendeBynavn ?? '',
      husnummerFra: int.tryParse(_selectedItem?.adresse?.husnummerFra ?? '0 ') ?? 0,
      postnummer: int.tryParse(_selectedItem?.adresse?.postnummer ?? '0 ') ?? 0,
    vejnavn: a?.vejnavn ?? '',
    );
    final com = Companies(name: _selectedItem?.name ?? '' , appelsinBrugerId: widget.appelsinbruger.id!, addresse: jsonEncode(ad), cvr: _selectedItem?.businessKeys.first.key);
   await _companyApi.createCompany(com);
}
}

import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/createbusiess/AddOwnerWidget.dart';
import 'package:appelsin/models/OwnerDTO.dart';
import 'package:appelsin/price/PriceWidget.dart';

class OwnersWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OwnersWidget();
}

class _OwnersWidget extends State<OwnersWidget> {
  // Dynamisk datakilde til liste af ejere
  final List<OwnerDTO> _owners = <OwnerDTO>[]; // growable

  @override
  void initState() {
    super.initState();
  }

  // Bygger et kort/Container for en ejer
  Widget _ownerCard(OwnerDTO owner) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
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
                child: Icon(Icons.edit),
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
                  onPressed: () {
                    navigateWithSlide(
                      context,
                      PriceWidget(),
                      SlideDirection.left,
                    );
                  },
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
    setState(() {
      _owners.add(value);
    });
  }

  Future<void> populate() async {
    setState(() {});
  }
}

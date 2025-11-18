import 'package:appelsin/appelsinkonto/AppelsinKontoWidget.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
class PriceWidget extends StatefulWidget {

  final Appelsinbruger appelsinbruger;
  const PriceWidget({Key? key, required this.appelsinbruger}):super(key: key);

  @override
  State<StatefulWidget> createState() => _PriceWidget();
}

class _PriceWidget extends State<PriceWidget> {
  int? _selectedIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Ensure exactly one page is shown at a time (no peeking)
    _pageController = PageController(viewportFraction: 1.0, keepPage: true);
    // Initialize selection to the first page so only that card is marked selected
    _selectedIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tiers = <_PriceTier>[
      _PriceTier(
        title: 'Startpakke',
        price: 89,
        period: 'kr. / mdr.',
        subtitle: 'Start på det billigste abonnement. Du kan altid opgradere.',
        included: 'Inkluderer 10 bilag pr. mdr.',
        popular: true,
      ),
      _PriceTier(
        title: 'Vækstkurven',
        price: 149,
        period: 'kr. / mdr.',
        subtitle: 'Når din virksomhed har voksværk, falder prisen per bilag.',
        included: 'Inkluderer 20 bilag pr. mdr.',
      ),
      _PriceTier(
        title: 'Plantage',
        price: 249,
        period: 'kr. / mdr.',
        subtitle: 'Voksepakken, når din virksomhed vokser ind i skyerne.',
        included: 'Inkluderer 40 bilag pr. mdr.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pris',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF392919),
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              child:
            Customwidgets.step(0.5, '6', '10'),
            ),
            const SizedBox(height: 8),
            // Slides between containers (one card per page)
            Expanded(
              child: ClipRect(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: tiers.length,
                  // Explicitly enforce one-at-a-time paging behavior
                  physics: const PageScrollPhysics(),
                  pageSnapping: true,
                  allowImplicitScrolling: false,
                  onPageChanged: (index) => setState(() => _selectedIndex = index),
                  itemBuilder: (context, i) {
                    final t = tiers[i];
                    final selected = _selectedIndex == i;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: _PriceCard(
                        tier: t,
                        selected: selected,
                        onTap: () {
                          // Tap selects and snaps to this page
                          setState(() => _selectedIndex = i);
                          if (_pageController.hasClients) {
                            _pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Simple dots indicator
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(tiers.length, (i) {
                  final active = (_selectedIndex ?? 0) == i;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: active ? const Color(0xFF0354F0) : const Color(0xFFD6CCBF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  );
                }),
              ),
            ),
            Container(
              child: ElevatedButton(onPressed:  (){
                navigateWithSlide(context, Appelsinkontowidget(appelsinbruger: widget.appelsinbruger), SlideDirection.left);
              }, child: Text("Videre")),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _PriceTier {
  final String title;
  final int price;
  final String period;
  final String subtitle;
  final String included;
  final bool popular;

  const _PriceTier({
    required this.title,
    required this.price,
    required this.period,
    required this.subtitle,
    required this.included,
    this.popular = false,
  });
}

class _PriceCard extends StatelessWidget {
  final _PriceTier tier;
  final bool selected;
  final VoidCallback? onTap;

  const _PriceCard({required this.tier, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? const Color(0xFF0354F0) : const Color(0xFFEEE3D8);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: const Color(0xFFF9F7F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: borderColor),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                Text(
                  tier.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF0354F0),
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                    height: 1.29,
                    letterSpacing: -1.12,
                  ),
                ),
                const SizedBox(height: 12),
                // Use Wrap so the period can flow to the next line on tight widths
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  spacing: 6,
                  children: [
                    Text(
                      '${tier.price}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF231303),
                        fontSize: 44,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      tier.period,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF231303),
                        fontSize: 20,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  tier.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF231303),
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    tier.included,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF392919),
                      fontSize: 16,
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          if (tier.popular)
            Positioned(
              left: 12,
              top: 12,
              child: Transform.rotate(
                angle: -0.13,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: const BoxDecoration(color: Color(0xFF29C678)),
                  child: const Text(
                    'Mest populær',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
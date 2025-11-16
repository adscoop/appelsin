import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';

class PriceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceWidget();
}

class _PriceWidget extends State<PriceWidget> {
  int? _selectedIndex;

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxW = constraints.maxWidth;
            // Decide the card width based on available width
            final double targetCardWidth = 354;
            final int columns = maxW ~/ (targetCardWidth + 16); // 16 is spacing
            final double cardWidth = columns <= 1
                ? (maxW - 32) // full width minus horizontal padding on small screens
                : targetCardWidth;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Customwidgets.step(0.5, '6', '10'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: List.generate(tiers.length, (i) {
                        final t = tiers[i];
                        final selected = _selectedIndex == i;
                        return SizedBox(
                          width: cardWidth,
                          child: _PriceCard(
                            tier: t,
                            selected: selected,
                            onTap: () => setState(() => _selectedIndex = i),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _selectedIndex == null ? null : () {
                          Navigator.of(context).maybePop(_selectedIndex);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0354F0),
                        ),
                        child: const Text(
                          'Videre',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
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
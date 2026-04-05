import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/glass_card.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategory = 0;
  final _searchCtrl = TextEditingController();

  static const _categories = [
    'All', 'Venues', 'Photographers', 'Florists',
    'Beauty', 'Music', 'Catering', 'Planners',
  ];

  static const _vendors = [
    _VendorData('Karma Kandara', 'Venue', 'Bukit Peninsula', 4.9, true),
    _VendorData('Alila Villas Uluwatu', 'Venue', 'Uluwatu', 4.8, true),
    _VendorData('The Layar', 'Private Villa', 'Seminyak', 4.9, false),
    _VendorData('Tirtha Uluwatu', 'Venue', 'Uluwatu', 4.7, false),
    _VendorData('Uma Kalai', 'Photographer', 'Ubud', 4.9, true),
    _VendorData('Alit & Co.', 'Florist', 'Canggu', 4.8, false),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaliBlissColors.editorialCream,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: BaliBlissColors.editorialCream,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our',
                  style: BaliBlissTypography.label(
                      size: 10, color: BaliBlissColors.editorialGold),
                ),
                Text(
                  'Vendors',
                  style: BaliBlissTypography.display(size: 24),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // Search
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: 'Search vendors, venues, photographers...',
                      hintStyle: BaliBlissTypography.sans(
                          size: 13, color: BaliBlissColors.mediumGray),
                      prefixIcon: const Icon(Icons.search,
                          color: BaliBlissColors.mediumGray, size: 18),
                      filled: true,
                      fillColor: BaliBlissColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ).animate().fadeIn(delay: 100.ms),

                // Category filter chips
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) {
                      final sel = i == _selectedCategory;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedCategory = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: sel
                                ? BaliBlissColors.editorialBlack
                                : BaliBlissColors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: sel
                                  ? BaliBlissColors.editorialBlack
                                  : BaliBlissColors.border,
                            ),
                          ),
                          child: Text(
                            _categories[i],
                            style: BaliBlissTypography.sans(
                              size: 12,
                              color: sel
                                  ? BaliBlissColors.white
                                  : BaliBlissColors.editorialCharcoal,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: i * 30),
                          );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Vendor list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FEATURED VENDORS',
                        style: BaliBlissTypography.label(
                            size: 10,
                            color: BaliBlissColors.editorialCharcoal),
                      ),
                      const SizedBox(height: 14),
                      ..._vendors.asMap().entries.map((e) =>
                          _VendorCard(vendor: e.value, index: e.key)),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VendorCard extends StatefulWidget {
  final _VendorData vendor;
  final int index;

  const _VendorCard({required this.vendor, required this.index});

  @override
  State<_VendorCard> createState() => _VendorCardState();
}

class _VendorCardState extends State<_VendorCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: BaliBlissColors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: BaliBlissColors.softShadow,
          ),
          child: Row(
            children: [
              // Image placeholder
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: BaliBlissColors.editorialCream,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.home_work_outlined,
                  color: BaliBlissColors.editorialGold,
                  size: 28,
                ),
              ),

              const SizedBox(width: 14),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.vendor.name,
                            style: BaliBlissTypography.display(
                                size: 15, weight: FontWeight.w400),
                          ),
                        ),
                        if (widget.vendor.featured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              gradient: BaliBlissColors.goldGradient,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'FEATURED',
                              style: BaliBlissTypography.label(
                                  size: 7,
                                  color: BaliBlissColors.editorialBlack),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.vendor.category.toUpperCase(),
                      style: BaliBlissTypography.label(
                          size: 9, color: BaliBlissColors.editorialGold),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.place_outlined,
                            size: 12, color: BaliBlissColors.mediumGray),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            widget.vendor.location,
                            style: BaliBlissTypography.sans(
                                size: 11,
                                color: BaliBlissColors.mediumGray),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: BaliBlissColors.editorialCream,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rounded,
                                  size: 10,
                                  color: BaliBlissColors.editorialGold),
                              const SizedBox(width: 3),
                              Text(
                                widget.vendor.rating.toString(),
                                style: BaliBlissTypography.sans(
                                    size: 10,
                                    color: BaliBlissColors.editorialCharcoal,
                                    weight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),
              const Icon(Icons.chevron_right,
                  color: BaliBlissColors.mediumGray, size: 18),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 + widget.index * 60))
        .slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
  }
}

class _VendorData {
  final String name;
  final String category;
  final String location;
  final double rating;
  final bool featured;

  const _VendorData(
      this.name, this.category, this.location, this.rating, this.featured);
}

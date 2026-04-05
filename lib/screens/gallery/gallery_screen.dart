import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedFilter = 0;
  static const _filters = ['All', 'Venue', 'Beach', 'Garden', 'Private', 'Cultural'];

  static const _collections = [
    _Collection('Clifftop Ceremonies', 'Uluwatu', 48, 'Venue', BaliBlissColors.blushSecondary, BaliBlissColors.blushText),
    _Collection('Jungle Romance', 'Ubud', 62, 'Garden', BaliBlissColors.sageSecondary, BaliBlissColors.sageText),
    _Collection('Beach Elopements', 'Seminyak', 35, 'Beach', BaliBlissColors.mintSecondary, BaliBlissColors.mintText),
    _Collection('Villa Weddings', 'Canggu', 41, 'Private', BaliBlissColors.lavenderSecondary, BaliBlissColors.lavenderText),
    _Collection('Traditional Bali', 'Gianyar', 27, 'Cultural', BaliBlissColors.roseGoldSecondary, BaliBlissColors.roseGoldText),
    _Collection('Sunset Ceremonies', 'Tanah Lot', 33, 'Iconic', BaliBlissColors.blushSecondary, BaliBlissColors.blushText),
  ];

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
                Text('Real', style: BaliBlissTypography.label(size: 10, color: BaliBlissColors.editorialGold)),
                Text('Weddings', style: BaliBlissTypography.display(size: 24)),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // Subtitle
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Inspiration from real Bali celebrations',
                      style: BaliBlissTypography.raleway(size: 13, color: BaliBlissColors.editorialCharcoal),
                    ),
                  ),
                ).animate().fadeIn(delay: 100.ms),

                // Filter chips
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) {
                      final sel = i == _selectedFilter;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedFilter = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: sel ? BaliBlissColors.editorialBlack : BaliBlissColors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: sel ? BaliBlissColors.editorialBlack : BaliBlissColors.border,
                            ),
                          ),
                          child: Text(
                            _filters[i],
                            style: BaliBlissTypography.sans(
                              size: 12,
                              color: sel ? BaliBlissColors.white : BaliBlissColors.editorialCharcoal,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Masonry grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    itemCount: _collections.length,
                    itemBuilder: (context, i) {
                      final col = _collections[i];
                      final tall = i % 3 == 0;
                      return _CollectionCard(
                          collection: col, index: i, tall: tall);
                    },
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

class _CollectionCard extends StatelessWidget {
  final _Collection collection;
  final int index;
  final bool tall;

  const _CollectionCard({required this.collection, required this.index, required this.tall});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: BaliBlissColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: BaliBlissColors.softShadow,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area
            Container(
              height: tall ? 180 : 120,
              color: collection.color,
              child: Stack(
                children: [
                  Center(
                    child: Icon(Icons.photo_outlined, size: 36, color: collection.textColor.withOpacity(0.4)),
                  ),
                  // Category badge
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        collection.category,
                        style: BaliBlissTypography.label(
                            size: 8, color: BaliBlissColors.editorialCharcoal),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collection.title,
                    style: BaliBlissTypography.display(size: 14, weight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 10, color: BaliBlissColors.mediumGray),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          collection.location,
                          style: BaliBlissTypography.sans(size: 10, color: BaliBlissColors.mediumGray),
                        ),
                      ),
                      Text(
                        '${collection.count} photos',
                        style: BaliBlissTypography.sans(size: 10, color: BaliBlissColors.editorialGold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 + index * 60))
        .slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
  }
}

class _Collection {
  final String title;
  final String location;
  final int count;
  final String category;
  final Color color;
  final Color textColor;

  const _Collection(this.title, this.location, this.count, this.category, this.color, this.textColor);
}

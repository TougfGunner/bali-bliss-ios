import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scroll = ScrollController();
  double _heroScale = 1.0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final offset = _scroll.offset;
      if (offset >= 0) {
        setState(() => _heroScale = 1.0 + (offset * 0.0003));
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  static const _categories = [
    _Category('explore', Icons.explore_outlined, 'Venues'),
    _Category('camera_alt', Icons.camera_alt_outlined, 'Photographers'),
    _Category('local_florist', Icons.local_florist_outlined, 'Florists'),
    _Category('music_note', Icons.music_note_outlined, 'Music'),
    _Category('face_retouching_natural', Icons.face_retouching_natural_outlined, 'Beauty'),
    _Category('restaurant', Icons.restaurant_outlined, 'Catering'),
  ];

  static const _stories = [
    _Story('Clifftop Vows', 'Uluwatu', 'Karma Kandara'),
    _Story('Jungle Ceremony', 'Ubud', 'Alaya Resort'),
    _Story('Beachfront Bliss', 'Seminyak', 'La Favela'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaliBlissColors.editorialCream,
      body: CustomScrollView(
        controller: _scroll,
        slivers: [
          // App bar
          SliverAppBar(
            pinned: true,
            backgroundColor: BaliBlissColors.editorialCream,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(
              'Bali Bliss',
              style: BaliBlissTypography.display(
                size: 22,
                style: FontStyle.italic,
              ),
            ).animate().fadeIn(duration: 600.ms),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: BaliBlissColors.editorialBlack),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: BaliBlissColors.editorialBlack),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === HERO SECTION ===
                _buildHero(context),

                const SizedBox(height: 28),

                // === BANNER ===
                _buildBanner(),

                const SizedBox(height: 32),

                // === CATEGORIES ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const SectionHeader(
                    label: 'Browse By',
                    title: 'Category',
                  ),
                ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),

                const SizedBox(height: 16),
                _buildCategories(),

                const SizedBox(height: 32),

                // === REAL WEDDINGS PREVIEW ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const SectionHeader(
                    label: 'Real',
                    title: 'Weddings',
                    subtitle: 'Curated stories from Bali celebrations',
                  ),
                ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),

                const SizedBox(height: 16),
                _buildStoriesRow(context),

                const SizedBox(height: 32),

                // === QUICK PLANNING ACTIONS ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const SectionHeader(
                    label: 'Your',
                    title: 'Planning Suite',
                  ),
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 16),
                _buildPlanningActions(context),

                const SizedBox(height: 32),

                // === CONTACT CTA ===
                _buildContactCta(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 280,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background
              Transform.scale(
                scale: _heroScale,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: BaliBlissColors.heroGradient,
                  ),
                ),
              ),

              // Decorative circles
              Positioned(
                top: -30,
                right: -30,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BaliBlissColors.editorialGold.withOpacity(0.08),
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Your Perfect',
                      style: BaliBlissTypography.script(
                        size: 28,
                        color: BaliBlissColors.editorialGold,
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                    Text(
                      'Bali Wedding',
                      style: BaliBlissTypography.display(
                        size: 36,
                        color: BaliBlissColors.white,
                      ),
                    ).animate().fadeIn(delay: 350.ms).slideY(begin: 0.2),

                    const SizedBox(height: 10),

                    Text(
                      'Luxury destination wedding planning\nin the Island of the Gods',
                      style: BaliBlissTypography.sans(
                        size: 13,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ).animate().fadeIn(delay: 500.ms),

                    const SizedBox(height: 20),

                    GoldButton(
                      label: 'Explore Vendors',
                      icon: Icons.arrow_forward,
                      onTap: () => context.go('/vendors'),
                    ).animate().fadeIn(delay: 650.ms).slideY(begin: 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.05),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: BaliBlissColors.editorialBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Book your 2026 Bali destination wedding — complimentary planning services included',
        textAlign: TextAlign.center,
        style: BaliBlissTypography.raleway(
          size: 12,
          color: BaliBlissColors.editorialGold,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      ),
    ).animate().fadeIn(delay: 150.ms);
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final cat = _categories[i];
          return _CategoryChip(cat: cat, index: i);
        },
      ),
    );
  }

  Widget _buildStoriesRow(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, i) {
          final story = _stories[i];
          return _StoryCard(story: story, index: i);
        },
      ),
    );
  }

  Widget _buildPlanningActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _ActionCard(
              title: 'BlissBook',
              subtitle: 'Your wedding workbook',
              icon: Icons.auto_stories_outlined,
              color: BaliBlissColors.blushSecondary,
              textColor: BaliBlissColors.blushText,
              onTap: () => context.go('/blissbook'),
              index: 0,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ActionCard(
              title: 'Gallery',
              subtitle: 'Wedding inspiration',
              icon: Icons.photo_library_outlined,
              color: BaliBlissColors.sageSecondary,
              textColor: BaliBlissColors.sageText,
              onTap: () => context.go('/gallery'),
              index: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCta() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassCard(
        tint: BaliBlissColors.editorialCream,
        child: Column(
          children: [
            Text(
              'Ready to Begin?',
              style: BaliBlissTypography.script(size: 32),
            ),
            const SizedBox(height: 8),
            Text(
              'Let\'s Plan Your Dream Wedding',
              textAlign: TextAlign.center,
              style: BaliBlissTypography.display(size: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'hello@baliblissweddings.com',
              style: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.mediumGray),
            ),
            const SizedBox(height: 4),
            Text(
              '+62 858 2154 6132',
              style: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.mediumGray),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 500.ms);
  }
}

class _CategoryChip extends StatelessWidget {
  final _Category cat;
  final int index;

  const _CategoryChip({required this.cat, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: BaliBlissColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: BaliBlissColors.softShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: BaliBlissColors.editorialCream,
              ),
              child: Icon(cat.iconData, size: 20, color: BaliBlissColors.editorialGold),
            ),
            const SizedBox(height: 8),
            Text(
              cat.name,
              textAlign: TextAlign.center,
              style: BaliBlissTypography.sans(
                size: 10,
                color: BaliBlissColors.editorialCharcoal,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(delay: Duration(milliseconds: 100 + index * 60))
          .slideY(begin: 0.2, end: 0),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final _Story story;
  final int index;

  const _StoryCard({required this.story, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF2D1B3D), Color(0xFF1a2744)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: BaliBlissColors.cardShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: BaliBlissColors.editorialGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: BaliBlissColors.editorialGold.withOpacity(0.3)),
                ),
                child: Text(
                  story.venue,
                  style: BaliBlissTypography.label(size: 8, color: BaliBlissColors.editorialGold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                story.title,
                style: BaliBlissTypography.display(size: 18, color: BaliBlissColors.white),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.place_outlined, size: 11, color: BaliBlissColors.mediumGray),
                  const SizedBox(width: 3),
                  Text(
                    story.location,
                    style: BaliBlissTypography.sans(size: 11, color: BaliBlissColors.mediumGray),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(delay: Duration(milliseconds: 200 + index * 100))
          .slideX(begin: 0.1, end: 0),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final int index;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: textColor),
            const SizedBox(height: 10),
            Text(
              title,
              style: BaliBlissTypography.display(size: 18, color: textColor, weight: FontWeight.w400),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: BaliBlissTypography.sans(size: 11, color: textColor.withOpacity(0.7)),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(delay: Duration(milliseconds: 300 + index * 80))
          .slideY(begin: 0.1, end: 0),
    );
  }
}

class _Category {
  final String key;
  final IconData iconData;
  final String name;
  const _Category(this.key, this.iconData, this.name);
}

class _Story {
  final String title;
  final String location;
  final String venue;
  const _Story(this.title, this.location, this.venue);
}

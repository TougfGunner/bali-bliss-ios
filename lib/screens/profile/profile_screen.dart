import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _menuItems = [
    _MenuItem(Icons.auto_stories_outlined, 'My BlissBook', 'Your planning workspace'),
    _MenuItem(Icons.favorite_outline, 'Saved Vendors', 'Your favourites'),
    _MenuItem(Icons.calendar_today_outlined, 'My Enquiries', 'Booking requests'),
    _MenuItem(Icons.description_outlined, 'Documents', 'Contracts & quotes'),
    _MenuItem(Icons.settings_outlined, 'Account Settings', 'Profile & preferences'),
    _MenuItem(Icons.help_outline, 'Help & Support', 'Contact the team'),
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
            title: Text('Profile', style: BaliBlissTypography.display(size: 24)),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // Profile hero card
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: BaliBlissColors.profileGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: BaliBlissColors.elevatedShadow,
                    ),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        // Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: BaliBlissColors.editorialGold, width: 1.5),
                            color: BaliBlissColors.editorialGold.withOpacity(0.1),
                          ),
                          child: const Icon(Icons.person_outline, size: 36, color: BaliBlissColors.editorialGold),
                        ),
                        const SizedBox(height: 12),
                        Text('Welcome back,', style: BaliBlissTypography.script(size: 24)),
                        const SizedBox(height: 4),
                        Text('Future Newlywed', style: BaliBlissTypography.display(size: 24, color: BaliBlissColors.white)),
                        const SizedBox(height: 6),
                        Text(
                          'Sign in to access your planning tools',
                          style: BaliBlissTypography.sans(size: 12, color: Colors.white.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 20),
                        GoldButton(
                          label: 'Sign In',
                          icon: Icons.arrow_forward,
                          onTap: () => context.go('/login'),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),

                // Stats row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _StatCard('—', 'Days to Go', 0),
                      const SizedBox(width: 10),
                      _StatCard('2/12', 'Tasks Done', 1),
                      const SizedBox(width: 10),
                      _StatCard('0', 'Saved', 2),
                    ],
                  ),
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 20),

                // Menu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: BaliBlissColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: BaliBlissColors.cardShadow,
                    ),
                    child: Column(
                      children: _menuItems.asMap().entries.map((e) {
                        final item = e.value;
                        final isLast = e.key == _menuItems.length - 1;
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              leading: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: BaliBlissColors.editorialCream,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(item.icon, size: 18, color: BaliBlissColors.editorialGold),
                              ),
                              title: Text(item.label, style: BaliBlissTypography.sans(size: 14, weight: FontWeight.w600, color: BaliBlissColors.editorialBlack)),
                              subtitle: Text(item.subtitle, style: BaliBlissTypography.sans(size: 11, color: BaliBlissColors.mediumGray)),
                              trailing: const Icon(Icons.chevron_right, color: BaliBlissColors.mediumGray, size: 18),
                              onTap: () {},
                            ),
                            if (!isLast)
                              Divider(height: 1, indent: 70, endIndent: 16, color: BaliBlissColors.border),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 24),

                // Brand footer
                Column(
                  children: [
                    Text('Bali Bliss', style: BaliBlissTypography.script(size: 32)),
                    const SizedBox(height: 4),
                    Text(
                      'The Ultimate Bali Wedding Guide',
                      style: BaliBlissTypography.raleway(
                          size: 11, color: BaliBlissColors.editorialCharcoal, letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 8),
                    Text('hello@baliblissweddings.com',
                        style: BaliBlissTypography.sans(size: 12, color: BaliBlissColors.mediumGray)),
                    const SizedBox(height: 2),
                    Text('+62 858 2154 6132',
                        style: BaliBlissTypography.sans(size: 12, color: BaliBlissColors.mediumGray)),
                  ],
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final int index;

  const _StatCard(this.value, this.label, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: BaliBlissColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: BaliBlissColors.softShadow,
        ),
        child: Column(
          children: [
            Text(value, style: BaliBlissTypography.sans(size: 18, weight: FontWeight.w700, color: BaliBlissColors.editorialBlack)),
            const SizedBox(height: 2),
            Text(label, textAlign: TextAlign.center, style: BaliBlissTypography.sans(size: 9, color: BaliBlissColors.mediumGray)),
          ],
        ),
      )
          .animate()
          .fadeIn(delay: Duration(milliseconds: 100 + index * 60))
          .scale(begin: const Offset(0.95, 0.95)),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final String subtitle;
  const _MenuItem(this.icon, this.label, this.subtitle);
}

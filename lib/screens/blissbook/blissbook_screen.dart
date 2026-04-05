import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/glass_card.dart';

class BlissBookScreen extends StatefulWidget {
  const BlissBookScreen({super.key});

  @override
  State<BlissBookScreen> createState() => _BlissBookScreenState();
}

class _BlissBookScreenState extends State<BlissBookScreen> {
  final _checklist = [
    _Task('Book your venue', true, 'Planning'),
    _Task('Choose your photographer', true, 'Planning'),
    _Task('Select floral arrangements', false, 'Décor'),
    _Task('Finalise guest list', false, 'Guests'),
    _Task('Book hair & makeup', false, 'Beauty'),
    _Task('Send save the dates', false, 'Guests'),
  ];

  void _toggleTask(int i) {
    setState(() => _checklist[i] = _Task(
          _checklist[i].title,
          !_checklist[i].done,
          _checklist[i].category,
        ));
  }

  static const _tools = [
    _Tool('Budget Tracker', 'Monitor every expense', Icons.attach_money_outlined,
        BaliBlissColors.mintSecondary, BaliBlissColors.mintText),
    _Tool('Guest List', 'Manage invitations', Icons.people_outline,
        BaliBlissColors.lavenderSecondary, BaliBlissColors.lavenderText),
    _Tool('Seating Chart', 'Plan your reception', Icons.table_bar_outlined,
        BaliBlissColors.sageSecondary, BaliBlissColors.sageText),
    _Tool('Timeline', 'Day-of schedule', Icons.schedule_outlined,
        BaliBlissColors.roseGoldSecondary, BaliBlissColors.roseGoldText),
    _Tool('Mood Board', 'Vision & inspiration', Icons.dashboard_outlined,
        BaliBlissColors.blushSecondary, BaliBlissColors.blushText),
    _Tool('Documents', 'Contracts & quotes', Icons.folder_outlined,
        BaliBlissColors.mintSecondary, BaliBlissColors.mintText),
  ];

  @override
  Widget build(BuildContext context) {
    final done = _checklist.where((t) => t.done).length;
    final total = _checklist.length;
    final progress = done / total;

    return Scaffold(
      backgroundColor: BaliBlissColors.editorialCream,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 0,
            backgroundColor: BaliBlissColors.editorialCream,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your',
                    style: BaliBlissTypography.label(
                        size: 10, color: BaliBlissColors.editorialGold)),
                Text('BlissBook', style: BaliBlissTypography.display(size: 24)),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // Hero glass card
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: BaliBlissColors.glassGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: BaliBlissColors.cardShadow,
                    ),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Planning Made',
                            style: BaliBlissTypography.script(size: 28)),
                        Text('Beautiful',
                            style: BaliBlissTypography.display(size: 32)),
                        const SizedBox(height: 8),
                        Text(
                          'All your wedding planning tools in one elegant space.',
                          style: BaliBlissTypography.sans(
                              size: 13,
                              color: BaliBlissColors.editorialCharcoal,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),

                // Progress section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: BaliBlissColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: BaliBlissColors.cardShadow,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Planning Progress',
                                style: BaliBlissTypography.sans(
                                    size: 14,
                                    color: BaliBlissColors.editorialBlack,
                                    weight: FontWeight.w600)),
                            Text('$done / $total',
                                style: BaliBlissTypography.sans(
                                    size: 14,
                                    color: BaliBlissColors.editorialGold,
                                    weight: FontWeight.w700)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Animated progress bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: BaliBlissColors.editorialCream,
                            valueColor: const AlwaysStoppedAnimation(
                                BaliBlissColors.editorialGold),
                            minHeight: 6,
                          ),
                        ).animate().scaleX(
                              begin: 0,
                              end: 1,
                              alignment: Alignment.centerLeft,
                              duration: 800.ms,
                              delay: 300.ms,
                              curve: Curves.easeOut,
                            ),

                        const SizedBox(height: 16),

                        // Checklist
                        ..._checklist.asMap().entries.map((e) => GestureDetector(
                              onTap: () => _toggleTask(e.key),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: e.value.done
                                            ? BaliBlissColors.editorialGold
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: e.value.done
                                              ? BaliBlissColors.editorialGold
                                              : BaliBlissColors.border,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: e.value.done
                                          ? const Icon(Icons.check,
                                              size: 12,
                                              color: Colors.white)
                                          : null,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        e.value.title,
                                        style: BaliBlissTypography.sans(
                                          size: 13,
                                          color: e.value.done
                                              ? BaliBlissColors.mediumGray
                                              : BaliBlissColors.editorialCharcoal,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: BaliBlissColors.editorialCream,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        e.value.category,
                                        style: BaliBlissTypography.label(
                                            size: 8,
                                            color: BaliBlissColors.editorialCharcoal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fadeIn(
                                  delay: Duration(milliseconds: 100 + e.key * 50),
                                )),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

                const SizedBox(height: 24),

                // Tools grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PLANNING TOOLS',
                          style: BaliBlissTypography.label(
                              size: 10,
                              color: BaliBlissColors.editorialCharcoal)),
                      const SizedBox(height: 14),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.3,
                        children: _tools
                            .asMap()
                            .entries
                            .map((e) => _ToolCard(tool: e.value, index: e.key))
                            .toList(),
                      ),
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

class _ToolCard extends StatelessWidget {
  final _Tool tool;
  final int index;

  const _ToolCard({required this.tool, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: tool.color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(tool.icon, size: 22, color: tool.textColor),
          const Spacer(),
          Text(tool.title,
              style: BaliBlissTypography.display(
                  size: 15, color: tool.textColor, weight: FontWeight.w400)),
          const SizedBox(height: 2),
          Text(tool.subtitle,
              style: BaliBlissTypography.sans(
                  size: 10, color: tool.textColor.withOpacity(0.7))),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 200 + index * 50))
        .slideY(begin: 0.1, end: 0);
  }
}

class _Task {
  final String title;
  final bool done;
  final String category;
  const _Task(this.title, this.done, this.category);
}

class _Tool {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color textColor;
  const _Tool(this.title, this.subtitle, this.icon, this.color, this.textColor);
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaliBlissColors.editorialBlack,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1F2937),
                  Color(0xFF0F1923),
                  Color(0xFF171717),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          // Gold orb top right
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    BaliBlissColors.editorialGold.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ).animate().scale(
                begin: const Offset(0.5, 0.5),
                duration: 2000.ms,
                curve: Curves.easeOut,
              ),

          // Gold orb bottom left
          Positioned(
            bottom: -60,
            left: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    BaliBlissColors.editorialGold.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ).animate().scale(
                begin: const Offset(0.3, 0.3),
                duration: 2500.ms,
                curve: Curves.easeOut,
              ),

          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Script line
                Text(
                  'Welcome to',
                  style: BaliBlissTypography.script(
                    size: 32,
                    color: BaliBlissColors.editorialGold.withOpacity(0.8),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 800.ms)
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: 8),

                // Main title
                Text(
                  'Bali Bliss',
                  style: BaliBlissTypography.display(
                    size: 56,
                    color: BaliBlissColors.white,
                    weight: FontWeight.w700,
                    style: FontStyle.italic,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 1000.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: 16),

                // Gold divider
                Container(
                  width: 60,
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: BaliBlissColors.goldGradient,
                  ),
                )
                    .animate()
                    .scaleX(delay: 900.ms, duration: 600.ms, curve: Curves.easeOut),

                const SizedBox(height: 16),

                // Tagline
                Text(
                  'The Ultimate Bali Wedding Guide',
                  style: BaliBlissTypography.raleway(
                    size: 13,
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: 2.5,
                    weight: FontWeight.w300,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 1100.ms, duration: 800.ms),
              ],
            ),
          ),

          // Loading indicator bottom
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: BaliBlissColors.editorialGold.withOpacity(0.6),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 1500.ms, duration: 600.ms),
        ],
      ),
    );
  }
}

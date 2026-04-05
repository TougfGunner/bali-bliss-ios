import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/vendors/vendors_screen.dart';
import 'screens/blissbook/blissbook_screen.dart';
import 'screens/gallery/gallery_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/auth/login_screen.dart';
import 'widgets/animated_bottom_nav.dart';
import 'theme/colors.dart';
import 'theme/theme.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) => _MainShell(child: child, location: state.uri.path),
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/vendors', builder: (_, __) => const VendorsScreen()),
        GoRoute(path: '/blissbook', builder: (_, __) => const BlissBookScreen()),
        GoRoute(path: '/gallery', builder: (_, __) => const GalleryScreen()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
      ],
    ),
  ],
);

class BaliBlissApp extends StatelessWidget {
  const BaliBlissApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bali Bliss Weddings',
      theme: BaliBlissTheme.light,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MainShell extends StatelessWidget {
  final Widget child;
  final String location;

  const _MainShell({required this.child, required this.location});

  int get _currentIndex {
    if (location.startsWith('/vendors')) return 1;
    if (location.startsWith('/blissbook')) return 2;
    if (location.startsWith('/gallery')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onTap(BuildContext context, int i) {
    const routes = ['/home', '/vendors', '/blissbook', '/gallery', '/profile'];
    context.go(routes[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaliBlissColors.editorialCream,
      body: child,
      bottomNavigationBar: BaliBlissBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => _onTap(context, i),
      ),
    );
  }
}

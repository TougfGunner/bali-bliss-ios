import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/glass_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaliBlissColors.editorialCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Back
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: BaliBlissColors.white,
                      shape: BoxShape.circle,
                      boxShadow: BaliBlissColors.softShadow,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 16, color: BaliBlissColors.editorialCharcoal),
                  ),
                ),
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: 32),

              // Brand
              Column(
                children: [
                  Text('Bali Bliss', style: BaliBlissTypography.script(size: 52))
                      .animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),
                  const SizedBox(height: 6),
                  Text(
                    'THE ULTIMATE BALI WEDDING GUIDE',
                    style: BaliBlissTypography.label(size: 9, color: BaliBlissColors.editorialCharcoal),
                  ).animate().fadeIn(delay: 250.ms),
                ],
              ),

              const SizedBox(height: 36),

              // Login card
              Container(
                decoration: BoxDecoration(
                  color: BaliBlissColors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: BaliBlissColors.elevatedShadow,
                ),
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back', style: BaliBlissTypography.display(size: 26)),
                    const SizedBox(height: 6),
                    Text(
                      'Sign in to continue planning your Bali wedding',
                      style: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.mediumGray, height: 1.5),
                    ),
                    const SizedBox(height: 28),

                    // Email
                    _FieldLabel('Email'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'hello@example.com',
                        hintStyle: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.mediumGray),
                        prefixIcon: const Icon(Icons.mail_outline, size: 18, color: BaliBlissColors.mediumGray),
                        filled: true,
                        fillColor: BaliBlissColors.lightGray,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    _FieldLabel('Password'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passCtrl,
                      obscureText: _obscurePass,
                      decoration: InputDecoration(
                        hintText: 'Your password',
                        hintStyle: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.mediumGray),
                        prefixIcon: const Icon(Icons.lock_outline, size: 18, color: BaliBlissColors.mediumGray),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePass ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              size: 18, color: BaliBlissColors.mediumGray),
                          onPressed: () => setState(() => _obscurePass = !_obscurePass),
                        ),
                        filled: true,
                        fillColor: BaliBlissColors.lightGray,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Forgot
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                          style: BaliBlissTypography.sans(size: 12, color: BaliBlissColors.editorialGold)),
                    ),
                    const SizedBox(height: 24),

                    // Sign in button
                    GestureDetector(
                      onTap: () => context.go('/home'),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: BaliBlissColors.heroGradient,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: BaliBlissColors.brandPrimary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('SIGN IN', style: BaliBlissTypography.button(color: BaliBlissColors.white)),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Divider
                    Row(children: [
                      Expanded(child: Divider(color: BaliBlissColors.border, height: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('or', style: BaliBlissTypography.sans(size: 12, color: BaliBlissColors.mediumGray)),
                      ),
                      Expanded(child: Divider(color: BaliBlissColors.border, height: 1)),
                    ]),
                    const SizedBox(height: 20),

                    // Register
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: BaliBlissTypography.sans(size: 13, color: BaliBlissColors.editorialCharcoal),
                          children: [
                            const TextSpan(text: 'New couple? '),
                            TextSpan(
                              text: 'Create account',
                              style: BaliBlissTypography.sans(
                                  size: 13,
                                  color: BaliBlissColors.editorialGold,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

              const SizedBox(height: 20),

              // Vendor hint
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.work_outline, size: 14, color: BaliBlissColors.mediumGray),
                  const SizedBox(width: 6),
                  Text('Are you a vendor? Sign in here',
                      style: BaliBlissTypography.sans(size: 12, color: BaliBlissColors.mediumGray)),
                ],
              ).animate().fadeIn(delay: 500.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        style: BaliBlissTypography.label(size: 9, color: BaliBlissColors.editorialCharcoal),
      );
}

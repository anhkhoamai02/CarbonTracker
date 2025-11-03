import 'package:flutter/material.dart';
import '../main.dart';
import 'signin.dart';
import 'signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // cho phép cuộn khi bàn phím bật lên
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Carbon Tracker',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Mid
                  Column(
                    children: [
                      // Logo
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Hello, Welcome!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Track your journey,\nsave the planet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 26),

                      // Buttons
                      GradientButton(
                        label: 'Log in',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        ),
                      ),
                      const SizedBox(height: 14),
                      GradientButton(
                        label: 'Sign up',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupScreen()),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Bottom
                  Column(
                    children: const [
                      Text(
                        'Or via social media',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(icon: FontAwesomeIcons.facebookF),
                          SizedBox(width: 18),
                          _SocialIcon(icon: FontAwesomeIcons.instagram),
                          SizedBox(width: 18),
                          _SocialIcon(icon: FontAwesomeIcons.google),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }
}

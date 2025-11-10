import 'package:flutter/material.dart';
import 'screens/onboard_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() => runApp(const CarbonTrackerApp());

class CarbonTrackerApp extends StatelessWidget {
  const CarbonTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 15, color: Colors.white70),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}

const green1 = Color(0xFFA5D6B6);
const green2 = Color(0xFF3E4D43);

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(), // fill toàn màn hình
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [green1, green2],
          stops: [0.55, 1.0],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const GradientButton({
    required this.label,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(35),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF85E489), Color(0xFF0B660F)]),
          borderRadius: BorderRadius.circular(35),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(35),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24) + padding,
            child: Center(
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700)),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration pillInput(String hint) => InputDecoration(
  hintText: hint,
  hintStyle: const TextStyle(color: Colors.white70),
  filled: true,
  fillColor: Colors.white.withOpacity(.22),
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
);

Widget spacer(double h) => SizedBox(height: h);

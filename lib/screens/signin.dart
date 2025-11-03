import 'package:flutter/material.dart';
import '../main.dart';
import 'signup.dart';
import 'home_shell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _remember = false;
  bool _obscure = true;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Carbon Tracker', style: t.titleLarge),
              spacer(26),
              Text('Welcome Back!', style: t.headlineMedium),
              spacer(6),
              const Text('Login to continue', style: TextStyle(color: Colors.white70)),
              spacer(22),
              const Text('Username', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(controller: _userCtrl, decoration: pillInput('Enter your username')),
              spacer(16),
              const Text('Password', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(
                controller: _passCtrl,
                obscureText: _obscure,
                decoration: pillInput('Enter your password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              spacer(1),
              Row(
                children: [
                  Checkbox(
                    value: _remember,
                    onChanged: (v) => setState(() => _remember = v ?? false),
                    side: const BorderSide(color: Colors.white70),
                    checkColor: Colors.white,
                    activeColor: Colors.white30,
                  ),
                  const Text('remember me'),
                  const Spacer(),
                ],
              ),
              spacer(1),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password?', style: TextStyle(color: Colors.white)),
              ),
              spacer(1),
              GradientButton(
                label: 'Log in',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeShell()),
                  );
                },
              ),
              spacer(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(color: Colors.white70)),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
                    child: const Text('Sign Up', style: TextStyle(color: Color(0xFF85E489), fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../main.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _ob1 = true, _ob2 = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
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
              Text('Create Account Now!', style: t.headlineMedium),
              spacer(18),
              const Text('Full Name', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(controller: _nameCtrl, textInputAction: TextInputAction.next, decoration: pillInput('Your name')),
              spacer(14),
              const Text('Email', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(controller: _emailCtrl, keyboardType: TextInputType.emailAddress, textInputAction: TextInputAction.next, decoration: pillInput('name@gmail.com')),
              spacer(14),
              const Text('Password', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(
                controller: _passCtrl,
                obscureText: _ob1,
                textInputAction: TextInputAction.next,
                decoration: pillInput('Enter password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_ob1 ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                    onPressed: () => setState(() => _ob1 = !_ob1),
                  ),
                ),
              ),
              spacer(14),
              const Text('Confirm Password', style: TextStyle(color: Colors.white)),
              spacer(8),
              TextField(
                controller: _confirmCtrl,
                obscureText: _ob2,
                decoration: pillInput('Re-enter password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_ob2 ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                    onPressed: () => setState(() => _ob2 = !_ob2),
                  ),
                ),
              ),
              spacer(20),
              GradientButton(
                label: 'Sign up',
                onPressed: () {
                  if (_passCtrl.text != _confirmCtrl.text) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signup pressed (demo)')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

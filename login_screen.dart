import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Government Panel Login", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
                TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.go('/dashboard'),
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ).animate().fade(duration: 500.ms).scale(delay: 200.ms),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:myfirst/dashboard_screen.dart';
import 'package:myfirst/dashboard_provider.dart'; // ✅ Import the provider

void main() {
  runApp(const AgricultureGovApp());
}

class AgricultureGovApp extends StatelessWidget {
  const AgricultureGovApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardProvider()), // ✅ Provider is now defined
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Agriculture Gov Panel',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey[100], // Light grey background
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green), // Replaces headline6
            bodyMedium: TextStyle(fontSize: 16, color: Colors.black87), // Replaces bodyText2
          ),

        ),
        routerConfig: _router,
      ),
    );
  }
}

// ✅ Improved Routing System
final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
  ],
);

// ✅ Styled Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/.jpg"), // Background image
            fit: BoxFit.cover,
            opacity: 0.3, // Subtle effect
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/Govlogo.png", height: 180,width: 180,), // Logo
              const SizedBox(height: 20),
              const Text("Government Agriculture Panel", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 20),
              _buildLoginField("Username", Icons.person),
              const SizedBox(height: 10),
              _buildLoginField("Password", Icons.lock, obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go("/dashboard"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginField(String hint, IconData icon, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }
}

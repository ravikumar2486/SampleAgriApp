import 'package:flutter/material.dart';

class CropPortalScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const CropPortalScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crop Portal")),
      body: Center(
        child: Text("Welcome, ${userData['name']}", style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}

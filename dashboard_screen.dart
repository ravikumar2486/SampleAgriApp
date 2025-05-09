import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Government Dashboard"),
        backgroundColor: Colors.green[700], // Improved color scheme
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header with Image
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[700]),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/Govlogo.png"), // Add a logo
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Government Panel",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(context, Icons.report, "Complaint Resolution", "/complaints"),
                  _buildDrawerItem(context, Icons.money, "Subsidy Management", "/subsidy"),
                  _buildDrawerItem(context, Icons.assignment, "Inspection Reports", "/inspections"),
                  _buildDrawerItem(context, Icons.policy, "Policy Updates", "/policies"),
                  _buildDrawerItem(context, Icons.analytics, "Analytics & Trends", "/analytics"),
                  _buildDrawerItem(context, Icons.support, "Tickets", "/tickets"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Govlogo.png"), // Background image

            opacity: 0.3, // Subtle effect
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the Government Panel",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            const SizedBox(height: 10),
            const Text(
              "Manage complaints, subsidies, policies, and more efficiently.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[700]), // Add icons
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: () => context.go(route),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer Schemes',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const PoliciesPage(),
    );
  }
}

class PoliciesPage extends StatefulWidget {
  const PoliciesPage({super.key});

  @override
  _PoliciesPageState createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  List<dynamic> policies = [];
  List<dynamic> filteredPolicies = [];
  bool isLoading = true;
  bool hasError = false;

  final TextEditingController _searchController = TextEditingController();

  // ✅ Replace this with the correct API details
  final String apiKey = "579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b";
  final String resourceId = "994c0b92-ca70-4f19-87d4-cc3197f2bfe5"; // Replace with actual resource ID
  final String apiUrl = "https://api.data.gov.in/resource/994c0b92-ca70-4f19-87d4-cc3197f2bfe5?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json";

  @override
  void initState() {
    super.initState();
    fetchPolicies();
  }

  Future<void> fetchPolicies() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          policies = data["records"] ?? []; // Handle null response
          filteredPolicies = policies;
          isLoading = false;
          hasError = false;
        });
      } else {
        throw Exception('Failed to load policies. Status code: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print("Error fetching policies: $error");
    }
  }

  // 🔍 Function to filter policies based on search query
  void filterPolicies(String query) {
    setState(() {
      filteredPolicies = policies.where((policy) {
        final title = policy['title']?.toLowerCase() ?? "";
        final description = policy['description']?.toLowerCase() ?? "";
        return title.contains(query.toLowerCase()) || description.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Government Policies for Farmers")),
      body: Column(
        children: [
          // 🔎 Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search Policies",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: filterPolicies, // Calls filtering function on input change
            ),
          ),

          // 📜 Display Policies
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator()) // Show loader
                : hasError
                ? const Center(child: Text("Failed to fetch data. Please try again later."))
                : filteredPolicies.isEmpty
                ? const Center(child: Text("No policies found"))
                : ListView.builder(
              itemCount: filteredPolicies.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      filteredPolicies[index]['title'] ?? "No Title",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      filteredPolicies[index]['description'] ?? "No Description Available",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

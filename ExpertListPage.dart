import 'package:flutter/material.dart';
import 'package:myfirst/DBExp/DBhelper.dart';
 // Import database helper

class ExpertListPage extends StatefulWidget {
  const ExpertListPage({super.key});

  @override
  State<ExpertListPage> createState() => _ExpertListPageState();
}

class _ExpertListPageState extends State<ExpertListPage> {
  late Future<List<Map<String, dynamic>>> _expertList;

  @override
  void initState() {
    super.initState();
    _loadExperts(); // Load data when page initializes
  }

  void _loadExperts() {
    setState(() { // Ensures UI refreshes
      _expertList = DBhelper.getInstance.getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Experts'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _expertList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Experts Found!"));
          }

          List<Map<String, dynamic>> expertList = snapshot.data!;

          return ListView.builder(
            itemCount: expertList.length,
            itemBuilder: (context, index) {
              var expert = expertList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    expert['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expertise: ${expert['expertise']}"),
                      Text("Contact: ${expert['contact']}"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      bool deleted = await DBhelper.getInstance.deleteNote(
                        sno: expert['sno'],
                      );
                      if (deleted) {
                        setState(() {
                          _loadExperts(); // Reload list after deletion
                        });
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

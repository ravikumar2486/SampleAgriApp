import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Hides debug banner
    home: ComplaintScreen(),
  ));
  
}

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint Resolution"),
        backgroundColor: Colors.green[700], // ✅ Styled AppBar
        actions: const [
          Icon(Icons.feedback, size: 28), // ✅ Icon for better UI
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          // ✅ Background Image for a better look
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset("assets/images/Govsoln.png", fit: BoxFit.fill),
            ),
          ),
          ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // ✅ Rounded Corners
                elevation: 4, // ✅ Elevation for a modern feel
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: const Icon(Icons.warning, color: Colors.red), // ✅ Icon for complaint type
                  ),
                  title: Text(
                    "Complaint #$index",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Farmer Issue: Delay in subsidy"),
                  trailing: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text("Resolve"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

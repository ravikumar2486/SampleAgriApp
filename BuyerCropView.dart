import 'package:flutter/material.dart';
import 'package:myfirst/local/DBconnect.dart';
import 'package:myfirst/local/DBRegister.dart';

class BuyerCropView extends StatefulWidget {
  const BuyerCropView({super.key});

  @override
  State<BuyerCropView> createState() => _BuyerCropViewState();
}

class _BuyerCropViewState extends State<BuyerCropView> {
  final DBconnect cropDB = DBconnect.getInstance;
  final Dbregister userDB = Dbregister.getInstance;

  List<Map<String, dynamic>> allCrops = [];

  void loadAllCrops() async {
    allCrops = await cropDB.getAllNotes();
    setState(() {});
  }

  void showFarmerDetail(String farmerEmail) async {
    final List<Map<String, dynamic>> users = await userDB.getAllNotes();
    final farmer = users.firstWhere((user) => user['email'] == farmerEmail, orElse: () => {});

    if (farmer.isEmpty) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Farmer Info"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name: ${farmer['name']}", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Email: ${farmer['email']}"),
            const SizedBox(height: 10),
            const Text("Contact the farmer for further inquiry.", style: TextStyle(fontStyle: FontStyle.italic))
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadAllCrops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Crops for Sale")),
      body: ListView.builder(
        itemCount: allCrops.length,
        itemBuilder: (context, index) {
          final crop = allCrops[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(crop['name']),
              subtitle: Text("Type: ${crop['type']} | Price: ₹${crop['price']}"),
              trailing: const Icon(Icons.info_outline),
              onTap: () => showFarmerDetail(crop['farmerEmail']),
            ),
          );
        },
      ),
    );
  }
}

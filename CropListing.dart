import 'package:flutter/material.dart';
import 'package:myfirst/local/DBConnect.dart';

class FarmerCropListing extends StatefulWidget {
  const FarmerCropListing({super.key});

  @override
  State<FarmerCropListing> createState() => _FarmerCropListingState();
}

class _FarmerCropListingState extends State<FarmerCropListing> {
  final TextEditingController cropController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final DBconnect dbRef = DBconnect.getInstance;

  List<Map<String, dynamic>> cropList = [];

  @override
  void initState() {
    super.initState();
    fetchCrops();
  }

  void fetchCrops() async {
    List<Map<String, dynamic>> list = await dbRef.getAllNotes();
    setState(() {
      cropList = list;
    });
  }

  void addCrop() async {
    String crop = cropController.text.trim();
    String price = priceController.text.trim();

    if (crop.isEmpty || price.isEmpty) return;

    bool success = await dbRef.addNote(mTitle: crop, mDesc: price);
    if (success) {
      cropController.clear();
      priceController.clear();
      fetchCrops();
    }
  }

  void deleteCrop(int sno) async {
    await dbRef.deleteNote(sno: sno);
    fetchCrops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer Crop Listing"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cropController,
              decoration: const InputDecoration(labelText: "Crop Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addCrop,
              child: const Text("Add Crop"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: cropList.isEmpty
                  ? const Center(child: Text("No crops listed yet."))
                  : ListView.builder(
                itemCount: cropList.length,
                itemBuilder: (context, index) {
                  final crop = cropList[index];
                  return Card(
                    child: ListTile(
                      title: Text(crop['Crop']),
                      subtitle: Text("Price: ₹${crop['Price']}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteCrop(crop['S_no']),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

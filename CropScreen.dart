import 'package:flutter/material.dart';
import 'market_service.dart';
// Import your service

void main(){
  runApp(const CropPriceScreen());
}
class CropPriceScreen extends StatefulWidget {
  const CropPriceScreen({super.key});

  @override
  _CropPriceScreenState createState() => _CropPriceScreenState();
}

class _CropPriceScreenState extends State<CropPriceScreen> {
  final MarketService _marketService = MarketService();
  List<Map<String, dynamic>> _cropPrices = [];
  bool _isLoading = false;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _fetchPrices("Maharashtra"); // Default state to fetch
  }

  Future<void> _fetchPrices(String state) async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      List<Map<String, dynamic>> prices = await _marketService.fetchCropPrices(state: state);
      setState(() {
        _cropPrices = prices;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to fetch data: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crop Market Prices"),
        backgroundColor: Colors.green[700],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // ✅ Show loader
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage, style: const TextStyle(color: Colors.red)))
          : ListView.builder(
        itemCount: _cropPrices.length,
        itemBuilder: (context, index) {
          var crop = _cropPrices[index];
          return Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.agriculture, color: Colors.green), // ✅ Crop Icon
              title: Text(crop["Crop"] ?? "Unknown Crop", style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Price: ₹${crop["Modal Price"] ?? "N/A"} / Quintal"),
            ),
          );
        },
      ),
    );
  }
}

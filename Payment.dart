import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map<String, dynamic>> _payments = [
    {"farmer": "John Doe", "amount": 500, "date": "10 Apr 2025"},
    {"farmer": "Alice Smith", "amount": 300, "date": "9 Apr 2025"},
  ];

  final TextEditingController _farmerController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addPayment() {
    if (_farmerController.text.isNotEmpty && _amountController.text.isNotEmpty) {
      setState(() {
        _payments.insert(
          0,
          {
            "farmer": _farmerController.text,
            "amount": double.parse(_amountController.text),
            "date": DateTime.now().toLocal().toString().split(' ')[0],
          },
        );
        _farmerController.clear();
        _amountController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crop Payment Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Payment Input Fields
            TextField(
              controller: _farmerController,
              decoration: const InputDecoration(labelText: "Farmer Name"),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount (₹)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addPayment,
              child: const Text("Add Payment"),
            ),
            const SizedBox(height: 20),
            const Text("Payment History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Payment List
            Expanded(
              child: ListView.builder(
                itemCount: _payments.length,
                itemBuilder: (context, index) {
                  final payment = _payments[index];
                  return ListTile(
                    leading: const Icon(Icons.attach_money, color: Colors.green),
                    title: Text("${payment['farmer']} - ₹${payment['amount']}"),
                    subtitle: Text("Date: ${payment['date']}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

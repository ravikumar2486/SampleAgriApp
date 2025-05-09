import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableScreen(),
    );
  }
}

class DataTableScreen extends StatelessWidget {
  DataTableScreen({super.key});

  final Map<String, dynamic> jsonData = {
    "fields": [
      {"id": "a", "label": "Year", "type": "string"},
      {"id": "b", "label": "Balance at Start - No.", "type": "string"},
      {"id": "c", "label": "Balance at Start - Amount", "type": "string"},
      {"id": "d", "label": "Issued during Year - No.", "type": "string"},
      {"id": "e", "label": "Issued during Year - Amount", "type": "string"},
      {"id": "t", "label": "Balance at End - No.", "type": "string"},
      {"id": "u", "label": "Balance at End - Amount", "type": "string"}
    ],
    "data": [
      ["2000-01", "23665.39", "8981.75", "1568.09", "1363.34", "24187.74", "10154.86"],
      ["2001-02", "24187.74", "10154.86", "1721.63", "1602.03", "24747.09", "11512.08"],
      ["2002-03", "24747.09", "11512.08", "2261.1", "2250", "25647.12", "13318.58"],
      ["2003-04", "25647.12", "13318.58", "2768.8", "2846.66", "26748.18", "15559.39"],
      ["2004-05", "26748.18", "15559.39", "3444.03", "3830.64", "28577.97", "18747.21"]
    ]
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fields = List<Map<String, dynamic>>.from(jsonData["fields"]);
    List<List<dynamic>> data = List<List<dynamic>>.from(jsonData["data"]);

    return Scaffold(
      appBar: AppBar(title: const Text("Data Table View")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: fields.map((field) => DataColumn(label: Text(field["label"]))).toList(),
            rows: data.map((row) {
              return DataRow(
                cells: row.map((cell) => DataCell(Text(cell.toString()))).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

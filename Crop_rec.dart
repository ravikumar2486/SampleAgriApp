import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crop Prediction',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CropPredictionPage(),
    );
  }
}

class CropPredictionPage extends StatefulWidget {
  @override
  _CropPredictionPageState createState() => _CropPredictionPageState();
}

class _CropPredictionPageState extends State<CropPredictionPage> {
  // Dropdown values for state and district
  String? selectedState;
  String? selectedDistrict;

  // Input controllers for crop parameters
  TextEditingController nController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController kController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController rainfallController = TextEditingController();

  // Dropdown options for states (all Indian states)
  List<String> states = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu',
    'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal',
    'Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli', 
    'Daman and Diu', 'Lakshadweep', 'Delhi', 'Puducherry'
  ];

  // Districts of Rajasthan
  Map<String, List<String>> districts = {
    'Rajasthan': [
      'Ajmer', 'Alwar', 'Banswara', 'Baran', 'Barmer', 'Bharatpur', 'Bhilwara',
      'Bikaner', 'Bundi', 'Chittorgarh', 'Churu', 'Dausa', 'Dholpur', 'Dungarpur',
      'Ganganagar', 'Hanumangarh', 'Jaipur', 'Jaisalmer', 'Jalore', 'Jhalawar',
      'Jhunjhunu', 'Jodhpur', 'Karauli', 'Kota', 'Nagaur', 'Pali', 'Pratapgarh',
      'Rajasthan', 'Rajsamand', 'Sawai Madhopur', 'Sikar', 'Sirohi', 'Sri Ganganagar',
      'Tonk', 'Udaipur'
    ],
  };

  // Placeholder prediction result
  String predictionResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Prediction System'),
        backgroundColor: Color(0xFF7AFF7A), // Using the color you specified
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // State Dropdown
              DropdownButton<String>(
                value: selectedState,
                hint: Text('Select State'),
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                    selectedDistrict = null; // Reset district when state changes
                  });
                },
                items: states.map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              // District Dropdown
              DropdownButton<String>(
                value: selectedDistrict,
                hint: Text('Select District'),
                onChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
                items: selectedState != null && selectedState == 'Rajasthan'
                    ? districts['Rajasthan']!.map((district) {
                        return DropdownMenuItem<String>(
                          value: district,
                          child: Text(district),
                        );
                      }).toList()
                    : [],
              ),
              SizedBox(height: 16),

              // Crop parameter inputs
              buildTextInput("N (ppm)", nController),
              buildTextInput("P (ppm)", pController),
              buildTextInput("K (ppm)", kController),
              buildTextInput("Soil pH", phController),
              buildTextInput("Temperature (°C)", temperatureController),
              buildTextInput("Humidity (%)", humidityController),
              buildTextInput("Rainfall (mm)", rainfallController),
              SizedBox(height: 16),

              // Prediction button
              ElevatedButton(
                onPressed: _predictCrop,
                child: Text('Predict Crop'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7AFF7A), // Button color
                ),
              ),
              SizedBox(height: 16),

              // Prediction result
              Text(
                predictionResult,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build TextInput for crop parameters
  Widget buildTextInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  // Placeholder function to simulate prediction
  void _predictCrop() {
    setState(() {
      // Simulate a prediction result
      predictionResult = "Predicted Crop: Wheat"; // Placeholder text
    });

    // Here, you can add the logic to call the backend model or use the local model
    // If using an API, send a request with the parameters and update `predictionResult`.
  }
}

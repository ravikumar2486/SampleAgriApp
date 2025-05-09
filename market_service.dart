import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class MarketService {
  static const String baseUrl = "https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24";
  static const String apiKey = "579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b";

  Future<List<Map<String, dynamic>>> fetchCropPrices({required String state}) async {
    final Uri url = Uri.parse(
        "$baseUrl?api-key=$apiKey&format=json&filters[State]=${Uri.encodeComponent(state)}");


    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        debugPrint("API Response: ${jsonData.toString()}");  // PRINT API RESPONSE

        if (jsonData.containsKey("records")) {
          return List<Map<String, dynamic>>.from(jsonData["records"]);
        } else {
          throw Exception("Unexpected API response format");
        }
      } else {
        throw Exception('Failed to load crop prices: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching crop prices: $e');
      return [];
    }
  }
}

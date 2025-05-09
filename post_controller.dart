import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'package:get/get.dart';

class PostController extends GetxController {
  var isloading = true.obs;
  var posts = [].obs;

  @override
  void onInit() {
    loadLocalData();
    super.onInit();
  }

  void loadLocalData() async {
    try {
      isloading(true);

      // Load JSON file from assets
      String jsonString = await rootBundle.rootBundle.loadString('assets/data.json');
      var data = jsonDecode(jsonString);

      if (data.containsKey("records")) {
        posts.assignAll(data["records"]);
      } else {
        print("Unexpected JSON format");
      }
    } catch (e) {
      print("Error loading local data: $e");
    } finally {
      isloading(false);
    }
  }
}

import 'package:get/get.dart';

class PostService extends GetConnect {
  Future<Response> getPosts() async {
    try {
      return await get(
        "https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json",
      ).timeout(const Duration(seconds: 10));
    } catch (e) {
      print("API Error: $e");
      return Response(statusCode: 500, body: "API Request Failed");
    }
  }
}

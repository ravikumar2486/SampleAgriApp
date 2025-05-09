import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirst/controller/post_controller.dart';

void main() {
  runApp(const MarketScreen());
}

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Market Price');

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back button icon
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
      body: Center(
        child: Obx(() {
          if (postController.isloading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (postController.posts.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            return ListView.builder(
              itemCount: postController.posts.length,
              itemBuilder: (context, index) {
                var crop = postController.posts[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "${crop["Commodity"]} (${crop["Variety"]})",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("📍 Market: ${crop["Market"]}, ${crop["District"]}"),
                        Text("💰 Price: ₹${crop["Modal_Price"]} per Quintal"),
                        Text("📅 Date: ${crop["Arrival_Date"]}"),
                      ],
                    ),
                    leading: const Icon(Icons.agriculture, size: 30, color: Colors.green),
                    tileColor: Colors.white,
                  ),
                );
              },
            );

          }
        }),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const Learn());
}

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return const LearnAndGrowPage();

  }
}

class LearnAndGrowPage extends StatefulWidget {
  const LearnAndGrowPage({super.key});

  @override
  State<LearnAndGrowPage> createState() => _LearnAndGrowPageState();
}

class _LearnAndGrowPageState extends State<LearnAndGrowPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allVideos = [
    {"title": "Soil nourishment", "id": "qGqR8wbnNpQ"},
    {"title": "Kisaan Card", "id": "T0S1w0sQJoU"},
    {"title": "Soil productivity", "id": "7ZHMITBkJ88"},

  ];

  List<Map<String, String>> _filteredVideos = [];
  List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _filteredVideos = _allVideos;
    _initializeControllers();
  }

  void _initializeControllers() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _controllers = _filteredVideos.map((video) {
      return YoutubePlayerController(
        initialVideoId: video["id"]!,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
    }).toList();
  }

  void _searchVideo(String query) {
    setState(() {
      _filteredVideos = _allVideos
          .where((video) => video["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          title: const Text("Learn and Grow Crops"),
          backgroundColor:Color(0x8017FF1E),

        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchVideo,
                decoration: InputDecoration(
                  labelText: "Search for Crop Videos",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => _searchVideo(_searchController.text),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Expanded(
              child: _filteredVideos.isEmpty
                  ? const Center(child: Text("No videos found"))
                  : ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          YoutubePlayer(
                            controller: _controllers[index],
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              _filteredVideos[index]["title"]!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  }
}

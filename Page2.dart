import 'package:flutter/material.dart';
import 'package:myfirst/Page5.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Flutter Demo Home Page');

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _preloadImages(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildMainContent();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  /// ✅ **Preload images to prevent frame drops**
  Future<void> _preloadImages(BuildContext context) async {
    await precacheImage(const AssetImage('assets/images/backg.png'), context);
    await precacheImage(const AssetImage('assets/images/logo.png'), context);
  }

  /// ✅ **Builds the main UI after assets are loaded**
  Widget _buildMainContent() {
    return Stack(
      children: [
        _buildBackground(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLogo(),
              const SizedBox(height: 100),
              _buildButton(
                text: "English",
                onTap: () {
                  _navigateToNextScreen(const MyApp2());
                },
              ),
              const SizedBox(height: 50),
              _buildButton(

                text: "हिन्दी",
                onTap: () {
                  print("Button Pressed");
                },
              ),
            ],
          ),
        ),
        _buildBackButton(),
      ],
    );
  }

  /// ✅ **Extracted Background Decoration**
  Widget _buildBackground() {
    return Container(

    );
  }

  /// ✅ **Logo Widget with Preloaded Image**
  Widget _buildLogo() {
    return Container(
      height: 180,
      width: 180,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// ✅ **Reusable Button with InkWell for Lightweight UI**
  Widget _buildButton({required String text, required VoidCallback onTap}) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ **Back Button with Safe Positioning**
  Widget _buildBackButton() {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  /// ✅ **Optimized Navigation with `pushReplacement` to Save Memory**
  void _navigateToNextScreen(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

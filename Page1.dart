import 'package:flutter/material.dart';
import 'package:myfirst/Page2.dart';
import 'package:myfirst/splash_screen.dart';

void main() {
  runApp(const Vigrow1());
}

class Vigrow1 extends StatelessWidget {
  const Vigrow1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// ✅ Make `_counter` a `ValueNotifier<int>` to avoid unnecessary rebuilds
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0); // ✅ Optimized

   void _incrementCounter() {
    _counter.value++; // ✅ Uses ValueNotifier instead of setState()
  }

  @override
  void dispose() {
    _counter.dispose(); // ✅ Dispose ValueNotifier to free memory
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ Preload images before use
              FutureBuilder(
                future: _preloadImages(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(); // ✅ Show a loader while image loads
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Get smarter with',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'VIGrow.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 120),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  _navigateToNextPage(context);
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Async Image Preloading
  Future<void> _preloadImages(BuildContext context) async {
    await precacheImage(const AssetImage('assets/images/logo.png'), context);
    await precacheImage(const AssetImage('assets/images/backg.png'), context);
  }

  // ✅ Optimized Navigation (Avoid Unnecessary Widget Builds)
  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }
}

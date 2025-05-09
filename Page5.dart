import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirst/LoginBuyer.dart';
import 'package:myfirst/Page6.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();

  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set transparent system bars
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      systemNavigationBarColor: Colors.green,
    ));

    return Scaffold(
      body: Stack(
        children: [

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                _buildLogo(),
                const SizedBox(height: 10),
                _buildTitle(),
                const Spacer(),
                _buildRoleSelection(context),
                _buildBottomSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          _buildBackButton(context),
        ],
      ),
    );
  }

  /// 🖼️ Background Image

  /// 🏡 Logo
  Widget _buildLogo() {
    return const Image(
      image: AssetImage('assets/images/logo.png'),
      height: 100,
      width: 100,
    );
  }

  /// 📢 Welcome Title
  Widget _buildTitle() {
    return Column(
      children: const [
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'MyFont',
          ),
        ),
        Text(
          "VIGrow",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'MyFont',
          ),
        ),
      ],
    );
  }

  /// 👨‍🌾 Role Selection Buttons
  Widget _buildRoleSelection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _roleButton(
            image: "assets/images/farmerlogo.png",
            text: "Farmer",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Vigrow6())),
          ),
          _roleButton(
            image: "assets/images/buyerlogo.png",
            text: "Buyer",
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (_) => Vigrow7())),
          ),
        ],
      ),
    );
  }

  /// 🛑 Common Role Selection Button
  Widget _roleButton({required String image, required String text, required VoidCallback onTap}) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: const Color(0xFF00FF40)),
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[300],
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }

  /// 🌍 Bottom Section with Discover More Button
  Widget _buildBottomSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "We’re popular in the agriculture market globally",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'SemiBold',
            ),
          ),
        ),
        const SizedBox(height: 15),

      ],
    );
  }

  /// ⬅️ Back Button
  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

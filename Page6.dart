import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myfirst/farmprofile.dart';
import 'package:flutter/rendering.dart';
import 'package:myfirst/AddNotePage.dart';
import 'package:myfirst/Learn.dart';

import 'package:myfirst/MarketScreen.dart';
import 'package:myfirst/Agriexperts.dart';
import 'package:myfirst/Page5.dart';
import 'package:myfirst/Govermentpolicgpt.dart';

void main() {
  runApp(const Vigrow6());
}

class Vigrow6 extends StatelessWidget {
  const Vigrow6({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Register'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void _register() {
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      _showErrorDialog("All fields are required");
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(email.text)) {
      _showErrorDialog("Enter a valid email address");
      return;
    }
    if (password.text != confirmPassword.text) {
      _showErrorDialog("Passwords do not match");
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SuccessPage(username.text)),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,


        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset('assets/images/logo.png', height: 90, width: 90),
                const SizedBox(height: 20),
                const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 33,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 15),
                _buildTextField(username, "Username", Icons.account_circle),
                const SizedBox(height: 20),
                _buildTextField(email, "Email", Icons.mail),
                const SizedBox(height: 20),
                _buildPasswordField(password, "Password", _passwordVisible, () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }),
                const SizedBox(height: 20),
                _buildPasswordField(confirmPassword, "Confirm Password", _confirmPasswordVisible, () {
                  setState(() {
                    _confirmPasswordVisible = !_confirmPasswordVisible;
                  });
                }),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF40).withOpacity(0.7),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Register", style: TextStyle(color: Colors.white)),
                  onPressed: _register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
    return Card(
      elevation: 5,
      child: TextField(
        controller: controller,

        style: const TextStyle(color: Colors.black), // Text appears in white
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:BorderSide.none,

          ),
          suffixIcon: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint, bool isVisible, VoidCallback toggleVisibility) {
    return Card(
      elevation: 5,
      child: TextField(
        controller: controller,

        style: const TextStyle(color: Colors.black), // Text appears in white
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,

          ),

          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
            onPressed: toggleVisibility,
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatefulWidget {
  final String username;
  const SuccessPage(this.username, {super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}
class _SuccessPageState extends State<SuccessPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> images = [
    'assets/images/Smart_farm1i.png',
    'assets/images/Smart_farmi.png',
    'assets/images/Smart_soil1i.png',




  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 38,),
        // IconButton(
        //   icon: const Icon(Icons.arrow_back), // Back button icon
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyApp2()),
        //     );
        //   },
        // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat_bubble_rounded),
              onPressed: (){

              },
              color: Colors.black,


            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: (){},

            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // <-- Open the drawer
                  },


                );
              }
            ),
          ],
      ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color:Colors.green[500]
                ),
                child: Text(
                  'Welcome ${widget.username}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.pan_tool),
                title: Text('Raise an Issue'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Home page
                },
              ),
              ListTile(
                leading: Icon(Icons.shop_sharp),
                title: Text('Near by Shops'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to Profile page
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle logout
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payments'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle logout
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle logout
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle logout
                },
              ),

              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      body:Container(

        child: Column(
          children: [
            const SizedBox(height: 0), // Space at the top
            Container(
              height: 190,
              width: 440,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 5), // Space between profile & search box


            // First Row (Articles & Reports)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center row items
              children: [
                InkWell(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Learn()),
                    );

                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 89,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/learn.png',
                                fit: BoxFit.cover,
                                width: 50,  // Adjusted size to fit inside 94x94
                                height: 50,
                              ),
                              SizedBox(height: 5), // Space between image and text
                              Text(
                                "Learn",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 35), // Space between items
                InkWell(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNotePage()),
                    );
                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 89,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/crop1.png',
                                fit: BoxFit.cover,
                                width: 50,  // Adjusted size to fit inside 94x94
                                height: 40,
                              ),
                              SizedBox(height: 2), // Space between image and text
                              Text(
                                "Crop Listing",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10), // Space before second row

            // Second Row (Guide & Reports)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center row items
              children: [

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgriExpertPlatform()),
                    );

                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 89,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Help.png',
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Experts",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width:35), // Space between items
                InkWell(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MarketScreen()),
                    );
                  },
                  child:Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 89,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/crop1.png',
                                fit: BoxFit.cover,
                                width: 50,  // Adjusted size to fit inside 94x94
                                height: 50,
                              ),
                              SizedBox(height: 5), // Space between image and text
                              Text(
                                "Market ",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Space before second row

            // Second Row (Guide & Reports)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center row items
              children: [

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GovernmentPoliciesScreen()),
                    );
                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 99,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Help.png',
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Govt",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width:35), // Space between items
                InkWell(

                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MarketScreen()),
                    // );
                  },
                  child:Card(
                    elevation: 12,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 99,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/crop1.png',
                                fit: BoxFit.cover,
                                width: 50,  // Adjusted size to fit inside 94x94
                                height: 50,
                              ),
                              SizedBox(height: 5), // Space between image and text
                              Text(
                                "Crop help ",
                                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Space before second row

            // Second Row (Guide & Reports)

          ],
        ),



      ),
        bottomNavigationBar:Container(
          padding: EdgeInsets.all(20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: (){

                    },
                    color: Colors.black,


                  ),
                  IconButton(
                    icon: const Icon(Icons.storefront),
                    onPressed: (){},

                  ),
                  IconButton(
                    icon: const Icon(Icons.add_box),
                    onPressed: () {},


                  ),
                  IconButton(
                    icon: const Icon(Icons.menu_book),
                    onPressed: () {},


                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Farmprofile()),
                      );
                    },


                  ),



                ]
            )
        )
    );



  }
}

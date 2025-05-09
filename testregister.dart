// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:myfirst/AddNotePage.dart';
// import 'package:myfirst/Learn.dart';
//
// import 'package:myfirst/MarketScreen.dart';
// import 'package:myfirst/Agriexperts.dart';
// import 'package:myfirst/Page5.dart';
// void main() {
//   runApp(const RegistrationApp());
// }
//
// class RegistrationApp extends StatelessWidget {
//   const RegistrationApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Registration',
//       home: const RegistrationPage(),
//     );
//   }
// }
//
// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});
//
//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }
//
// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController username = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final TextEditingController confirmPassword = TextEditingController();
//   String gender = "Male";
//   bool _passwordVisible = false;
//   bool _confirmPasswordVisible = false;
//
//
//   void _register() {
//     if (username.text.isEmpty ||
//         email.text.isEmpty ||
//         password.text.isEmpty ||
//         confirmPassword.text.isEmpty) {
//       _showErrorDialog("All fields are required");
//       return;
//     }
//     if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(email.text)) {
//       _showErrorDialog("Enter a valid email address");
//       return;
//     }
//     if (password.text != confirmPassword.text) {
//       _showErrorDialog("Passwords do not match");
//       return;
//     }
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => SuccessPage(username.text)),
//     );
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           )
//         ],
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFDFFFD9),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/logo.png', height: 100),
//               const SizedBox(height: 10),
//               const Text(
//                 "Registration",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               _buildTextField(username, "Username", Icons.account_circle),
//               const SizedBox(height: 20),
//               _buildTextField(email, "Email", Icons.mail),
//               const SizedBox(height: 20),
//               _buildPasswordField(password, "Password", _passwordVisible, () {
//                 setState(() {
//                   _passwordVisible = !_passwordVisible;
//                 });
//               }),
//               const SizedBox(height: 20),
//               _buildPasswordField(confirmPassword, "Confirm Password", _confirmPasswordVisible, () {
//                 setState(() {
//                   _confirmPasswordVisible = !_confirmPasswordVisible;
//                 });
//               }),
//               const SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text("Gender", style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildGenderRadio("Male"),
//                   _buildGenderRadio("Female"),
//                   _buildGenderRadio("Prefer Not Say"),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
//                 ),
//                 onPressed: () {
//                   _register();
// ;                },
//                 child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
//               ),
//               const SizedBox(height: 20),
//               const Text("— Or Continue with —"),
//               const SizedBox(height: 15),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     side: const BorderSide(color: Colors.black12),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                 ),
//                 icon: Image.asset('assets/images/google.png', height: 24),
//                 label: const Text(
//                   "Google",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
//     return Card(
//       elevation: 5,
//       child: TextField(
//         controller: controller,
//
//         style: const TextStyle(color: Colors.black), // Text appears in white
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.black),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide:BorderSide.none,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide:BorderSide.none,
//
//           ),
//           suffixIcon: Icon(icon, color: Colors.black),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPasswordField(TextEditingController controller, String hint, bool isVisible, VoidCallback toggleVisibility) {
//     return Card(
//       elevation: 5,
//       child: TextField(
//         controller: controller,
//
//         style: const TextStyle(color: Colors.black), // Text appears in white
//         obscureText: !isVisible,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.black),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(color: Colors.white, width: 4),
//
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(color: Colors.white, width: 4),
//
//           ),
//
//           suffixIcon: IconButton(
//             icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
//             onPressed: toggleVisibility,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//   Widget _buildGenderRadio(String value) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Radio<String>(
//           value: value,
//           groupValue: gender,
//           onChanged: (newValue) {
//             setState(() {
//               gender = newValue!;
//             });
//           },
//         ),
//         Text(value),
//       ],
//     );
//   }
// }
//
//
// class SuccessPage extends StatelessWidget {
//   final String username;
//   const SuccessPage(this.username, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Farmer"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back), // Back button icon
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => MyApp2()),
//             );
//           },
//         ),
//       ),
//       body:Container(
//
//         child: Column(
//           children: [
//             const SizedBox(height: 0), // Space at the top
//             Container(
//               height: 190,
//               width: 440, // Reduce size to move buttons up
//               decoration: BoxDecoration(
//
//
//                 image: const DecorationImage(
//                   image: AssetImage('assets/images/field.jpeg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 0, top: 100),
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 9),
//
//                   width: 10,
//
//                   child:Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures fixed distance
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "Hi, $username",
//                           overflow: TextOverflow.ellipsis, // Prevents long names from pushing logo
//                           style: TextStyle(fontSize: 34, color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(width: 10), // Keeps space fixed
//                       Container(
//                         width: 70, // Fixed size for logo
//                         height: 70,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/images/farmerlogo.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 30), // Space between profile & search box
//
//
//             // First Row (Articles & Reports)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center, // Center row items
//               children: [
//                 InkWell(
//
//                   onTap: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Learn()),
//                     );
//
//                   },
//                   child: Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0.0),
//
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/learn.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,  // Adjusted size to fit inside 94x94
//                                 height: 50,
//                               ),
//                               SizedBox(height: 5), // Space between image and text
//                               Text(
//                                 "Learn",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width: 35), // Space between items
//                 InkWell(
//
//                   onTap: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => AddNotePage()),
//                     );
//                   },
//                   child: Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/crop1.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,  // Adjusted size to fit inside 94x94
//                                 height: 40,
//                               ),
//                               SizedBox(height: 2), // Space between image and text
//                               Text(
//                                 "Crop Listing",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 15), // Space before second row
//
//             // Second Row (Guide & Reports)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center, // Center row items
//               children: [
//
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => AgriExpertPlatform()),
//                     );
//
//                   },
//                   child: Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/Help.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,
//                                 height: 50,
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "Experts",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width:35), // Space between items
//                 InkWell(
//
//                   onTap: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MarketScreen()),
//                     );
//                   },
//                   child:Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/crop1.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,  // Adjusted size to fit inside 94x94
//                                 height: 50,
//                               ),
//                               SizedBox(height: 5), // Space between image and text
//                               Text(
//                                 "Market ",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15), // Space before second row
//
//             // Second Row (Guide & Reports)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center, // Center row items
//               children: [
//
//                 InkWell(
//                   onTap: () {
//
//
//
//                   },
//                   child: Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/Help.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,
//                                 height: 50,
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "Govst",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width:35), // Space between items
//                 InkWell(
//
//                   onTap: (){
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => MarketScreen()),
//                     // );
//                   },
//                   child:Card(
//                     elevation: 12,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 89,
//                       width: 64,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/crop1.png',
//                                 fit: BoxFit.cover,
//                                 width: 50,  // Adjusted size to fit inside 94x94
//                                 height: 50,
//                               ),
//                               SizedBox(height: 5), // Space between image and text
//                               Text(
//                                 "Crop help ",
//                                 style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Space before second row
//
//             // Second Row (Guide & Reports)
//
//           ],
//         ),
//
//
//
//       ),
//     );
//
//
//
//   }
// }
//

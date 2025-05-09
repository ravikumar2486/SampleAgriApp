import 'package:flutter/material.dart';
import 'package:myfirst/GovermentPannel.dart';
import 'package:myfirst/local/DBRegister.dart';

class AddRegisterDetail extends StatefulWidget {
  const AddRegisterDetail({super.key});

  @override
  State<AddRegisterDetail> createState() => _AddRegisterDetailState();
}

class _AddRegisterDetailState extends State<AddRegisterDetail> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final Dbregister dbRef = Dbregister.getInstance;
  String errorMsg = "";

  void registerUser() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorMsg = "*Please fill all fields*";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        errorMsg = "*Passwords do not match*";
      });
      return;
    }

    bool success = await dbRef.addNote(
      mName: name,
      mEmail: email,
      mPassword: password,
    );

    if (success) {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      if (mounted) {
        // Navigate to login screen (replace this with your actual login screen)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()), // Replace with your Login screen
        );
      }
    } else {
      setState(() {
        errorMsg = "*Failed to register user*";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text("Register"),
            ),
            if (errorMsg.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  errorMsg,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

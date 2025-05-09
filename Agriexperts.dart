import 'package:flutter/material.dart';
import 'package:myfirst/ExpertListPage.dart';
import 'package:myfirst/DBExp/DBhelper.dart';


void main() {
  runApp(const AgriExpertPlatform());
}

class AgriExpertPlatform extends StatelessWidget {
  const AgriExpertPlatform({super.key});

  @override
  Widget build(BuildContext context) {

    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back button icon
    onPressed: () {
    Navigator.pop(context);
    },
    ),
        title: const Text('Agri Experts Hub'),
        backgroundColor:Color(0x9017FF1E),

        elevation: 4, // Adds a shadow effect
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Add an illustration or logo
            Container(
              height: 250, // Increased size
              width: 250,  // Increased size
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Rounded corners for style
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Adds shadow for better visual

                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Ensures rounded corners apply to image
                child: Image.asset(
                  'assets/images/Agriexpert.png',
                  fit: BoxFit.contain, // Keeps the whole image visible
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Title Text
            const Text(
              "Welcome to Agri Experts Hub!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            const Text(
              "Connect with agriculture experts, get advice, and discuss farming challenges.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // 🔹 Register Button
            ElevatedButton.icon(
              icon: const Icon(Icons.person_add, size: 26),
              label: const Text('Register as Expert', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 View Experts Button

            const SizedBox(height: 15),

            // 🔹 Join Discussion Button
            ElevatedButton.icon(
              icon: const Icon(Icons.forum, size: 26),
              label: const Text("Join Discussion", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiscussionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _expertiseController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  Future<void> _registerExpert() async {
    String name = _nameController.text.trim();
    String expertise = _expertiseController.text.trim();
    String contact = _contactController.text.trim();

    if (name.isEmpty || expertise.isEmpty || contact.isEmpty) {
      _showErrorDialog("All fields are required!");
      return;
    }
    if (name.isNotEmpty && expertise.isNotEmpty && contact.isNotEmpty) {
    bool success = await DBhelper.getInstance.addDetail(
      mName: name,
      mExpertise: expertise,
      mContact: contact,
    );

    if (success) {
      _showSuccessDialog("Registration Successful!");
    }
    if(mounted){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExpertListPage()),
      );
    }}
    else {
      _showErrorDialog("Failed to register. Try again!");
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement( // Navigate to Expert List Page
                context,
                MaterialPageRoute(builder: (context) => const ExpertListPage()),
              );
            },
            child: const Text("OK"),
          )
        ],
      ),
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
      appBar: AppBar(
        title: const Text('Expert Registration'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _expertiseController,
              decoration: const InputDecoration(labelText: 'Expertise'),
            ),
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Contact Info'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerExpert,
              child: const Text('Register'),
            ),

          ],
        ),
      ),
    );
  }
}


class DiscussionPage extends StatelessWidget {
  const DiscussionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Discussions'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          DiscussionTile(title: 'Scarcity of Water in Farming'),
          DiscussionTile(title: 'Lack of Nutrition in Crops'),
          DiscussionTile(title: 'Smart Irrigation Solutions'),
          DiscussionTile(title: 'lack of goverment Solutions'),
          DiscussionTile(title: 'PM Kissan card'),
        ],
      ),
    );
  }
}

class DiscussionTile extends StatelessWidget {
  final String title;

  const DiscussionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: const Icon(Icons.chat),
          onPressed: () {
            // Open discussion thread (implement logic)
          },
        ),
      ),
    );
  }
}

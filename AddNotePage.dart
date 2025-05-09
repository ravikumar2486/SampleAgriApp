import 'package:flutter/material.dart';
import 'package:myfirst/local/DBconnect.dart';
import 'NotesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddNotePage(),
    );
  }
}

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DBconnect? dbRef;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    dbRef = DBconnect.getInstance;
  }

  void addNoteAndNavigate() async {
    var title = titleController.text.trim();
    var desc = descController.text.trim();

    if (title.isNotEmpty && desc.isNotEmpty) {
      bool success = await dbRef!.addNote(mTitle: title, mDesc: desc);
      if (success) {
        titleController.clear();
        descController.clear();
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotesPage()),
          );
        }
      }
    } else {
      setState(() {
        errorMsg = "*Please fill all required fields*";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 38,),
      ),
      body:SafeArea(
    child: Stack(
    children: [
    // Background image


    // Foreground scrollable content
    SingleChildScrollView(
    reverse: true,
    child: Padding(
    padding: EdgeInsets.only(
    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
    ),
    child: Column(
    children: [
    Card(
      elevation:7,
      child: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(16),
         
      ),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      const Text(
      "Add New Crop",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      TextField(
      controller: titleController,
      decoration: InputDecoration(
      hintText: 'Enter the Crop here',
      labelText: 'Crop*',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      ),
      ),
      ),
      const SizedBox(height: 16),
      TextField(
      controller: descController,
      decoration: InputDecoration(
      hintText: 'Enter price here',
      labelText: 'Price*',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      ),
      ),
      ),
      const SizedBox(height: 16),
        // Save Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: addNoteAndNavigate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 10), // Spacing
      
        // ✅ View Notes Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              // Different color for distinction
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "View Crops",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      
        if (errorMsg.isNotEmpty)
      Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
      errorMsg,
      style: const TextStyle(color: Colors.red),
      ),
      ),
      ],
      ),
      ),
    ),
    ],
    ),
    ),
    ),
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
                    onPressed: () {},


                  ),



                ]
            )
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:myfirst/local/DBconnect.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Map<String, dynamic>> allNotes = [];
  DBconnect? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBconnect.getInstance;
    fetchNotes();
  }

  void fetchNotes() async {
    allNotes = await dbRef!.getAllNotes();
    if (mounted) {
      setState(() {});
    }
  }

  void deleteNote(int noteId) async {
    await dbRef!.deleteNote(sno: noteId);
    fetchNotes(); // Refresh notes list after deletion
  }

  void updateNote(int noteId, String currentTitle, String currentDesc) {
    TextEditingController titleController = TextEditingController(text: currentTitle);
    TextEditingController descController = TextEditingController(text: currentDesc);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                String newTitle = titleController.text.trim();
                String newDesc = descController.text.trim();

                if (newTitle.isNotEmpty && newDesc.isNotEmpty) {
                  await dbRef!.updateNote(sno: noteId, title: newTitle, desc: newDesc);
                  fetchNotes(); // Refresh list after update
                  Navigator.pop(context);
                }
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 38,),

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
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},


          ),
        ],
      ),
      body: allNotes.isEmpty
          ? const Center(child: Text('No notes yet!!', style: TextStyle(fontSize: 18)))
          : ListView.builder(
        itemCount: allNotes.length,
        itemBuilder: (_, index) {
          return
            GestureDetector(
              onTap: (){

              },

            child:Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    allNotes[index][DBconnect.COLUMN_NOTE_SNO].toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),

                  // Image
                  Container(
                    child: Image.asset(
                    'assets/images/farmerlogo.png',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),),
                  const SizedBox(width: 12),

                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${allNotes[index][DBconnect.COLUMN_NOTE_TITLE]}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Price per Kg: ${allNotes[index][DBconnect.COLUMN_NOTE_DESC].toString()}",
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  // Edit and Delete Icons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => updateNote(
                          allNotes[index][DBconnect.COLUMN_NOTE_SNO],
                          allNotes[index][DBconnect.COLUMN_NOTE_TITLE],
                          allNotes[index][DBconnect.COLUMN_NOTE_DESC],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteNote(
                          allNotes[index][DBconnect.COLUMN_NOTE_SNO],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
            );
        },
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

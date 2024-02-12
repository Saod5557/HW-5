import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'view_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       
        title: const Text(
          "مذكراتي ",
          style: TextStyle(
            color: Colors.white, 
            fontSize: 33, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, 
        backgroundColor: const Color.fromARGB(255, 15, 2, 50), 
        elevation: 40,
        
        
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Button for adding a new note.
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddNotePage())),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 15, 2, 50), 
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
              ),
              child: const Text("إضافة مذكرة", style: TextStyle(fontSize: 29)),
            ),
            const SizedBox(height: 20), // Add space between the buttons
            // Button for viewing all notes.
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewNotesPage())),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 15, 2, 50), 
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
              ),
              child: const Text("عرض مذكراتي", style: TextStyle(fontSize: 29)),
            ),
          ],
        ),
      ),
    );
  }
}

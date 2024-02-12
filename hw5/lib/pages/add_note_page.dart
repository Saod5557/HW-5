import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _controller = TextEditingController();

  Future<void> _saveNote() async {
    // Save the entered text to SharedPreferences.
    final pref = GetIt.I<SharedPreferences>();
    await pref.setString(DateTime.now().toIso8601String(), _controller.text);
    Navigator.of(context).pop(); // Return to the previous screen after saving.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "مذكرة جديدة",
          style: TextStyle(
            color: Colors.white, 
            fontSize: 33, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, 
        backgroundColor: const Color.fromARGB(255, 15, 2, 50),
        elevation: 40,
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: <Widget>[
              // Text field for entering the note.
              TextField(
                controller: _controller,
                textAlign: TextAlign.center, 
                decoration: const InputDecoration(
                  hintText: "اكتب مذكرتك هنا...",
                  border: OutlineInputBorder(), 
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0), 
                ),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: _saveNote,
                child: Text("حفظ"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewNotesPage extends StatelessWidget {
  const ViewNotesPage({super.key});

  Future<Map<String, String>> _loadNotes() async {
     // Load all notes from SharedPreferences.
    final pref = GetIt.I<SharedPreferences>();
    return pref.getKeys().fold<Map<String, String>>({}, (Map<String, String> map, key) {
      map[key] = pref.getString(key)!;
      return map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "مذكراتي اليومية",
          style: TextStyle(
            color: Colors.white, 
            fontSize: 33, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, 
        backgroundColor: const Color.fromARGB(255, 15, 2, 50), 
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _loadNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data!;
            if (notes.isNotEmpty) {
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  String key = notes.keys.elementAt(index);
                  return ListTile(
                    title: Text(
                      notes[key]!,
                      textAlign: TextAlign.center, 
                      style: const TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                    subtitle: Text(
                      key,
                      textAlign: TextAlign.center, 
                      style: const TextStyle(
                        fontSize: 16, 
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'لا توجد مذكرات محفوظة',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

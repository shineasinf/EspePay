import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class PracticePage extends StatelessWidget {
  final Role role;
  const PracticePage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    if (role != Role.student) {
      return const Scaffold(
        body: Center(child: Text("Practice available for students only.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Practice")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.quiz),
              title: const Text("Math Quiz"),
              subtitle: const Text("5 questions • Due tomorrow"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Starting Math Quiz...")),
                  );
                },
                child: const Text("Start"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.science),
              title: const Text("Science Worksheet"),
              subtitle: const Text("10 questions • Due next week"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Opening Science Worksheet...")),
                  );
                },
                child: const Text("Open"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


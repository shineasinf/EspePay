import 'package:flutter/material.dart';

class ReportCardPage extends StatelessWidget {
  const ReportCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = {
      'Matematika': 'A-',
      'Fisika': 'B+',
      'Bahasa Inggris': 'A'
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Rapor')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rapor Semester',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...subjects.entries
                      .map((e) => ListTile(
                            title: Text(e.key),
                            trailing: Text(e.value),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


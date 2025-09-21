import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      '07:00 - 08:30 Matematika',
      '08:45 - 10:15 Fisika',
      '10:30 - 12:00 Bahasa Inggris'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Pelajaran')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: schedule
            .map((s) => Card(
                  child: ListTile(title: Text(s)),
                ))
            .toList(),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  final String studentName;

  const SchedulePage({super.key, required this.studentName}); // ← tambahkan parameter

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'day': 'Senin', 'time': '07:00 - 08:30', 'subject': 'Matematika'},
      {'day': 'Senin', 'time': '08:30 - 09:30', 'subject': 'Bahasa Indonesia'},
      {'day': 'Selasa', 'time': '07:00 - 08:30', 'subject': 'IPA'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Jadwal - $studentName')),
      body: ListView.builder(
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final s = schedule[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.schedule, color: Colors.green),
              title: Text(s['subject'] ?? ''),
              subtitle: Text('${s['day']} | ${s['time']}'),
            ),
          );
        },
      ),
    );
  }
}


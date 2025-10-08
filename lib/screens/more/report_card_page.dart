import 'package:flutter/material.dart';

class ReportCardPage extends StatelessWidget {
  final String studentName;

  const ReportCardPage({super.key, required this.studentName}); // ← tambahkan parameter

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> grades = [
      {'type': 'Ulangan Harian', 'subject': 'Matematika', 'score': 85},
      {'type': 'PR', 'subject': 'Bahasa Indonesia', 'score': 90},
      {'type': 'Tugas', 'subject': 'IPA', 'score': 88},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Laporan Nilai - $studentName')),
      body: ListView.builder(
        itemCount: grades.length,
        itemBuilder: (context, index) {
          final g = grades[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.assignment, color: Colors.blueAccent),
              title: Text('${g['subject']} (${g['type']})'),
              trailing: Text(
                '${g['score']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}


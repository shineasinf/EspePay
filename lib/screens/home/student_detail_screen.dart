import 'package:flutter/material.dart';
import 'package:xolana/theme/app_theme.dart';

class StudentDetailScreen extends StatelessWidget {
  final String name;
  final String studentClass;

  const StudentDetailScreen({
    super.key,
    required this.name,
    required this.studentClass,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XolanaColors.xRed,
        title: Text("Detail $name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Kelas $studentClass",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "📊 Progress Belajar:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.7,
              color: XolanaColors.xRed,
              backgroundColor: Colors.grey.shade300,
              minHeight: 8,
            ),
            const SizedBox(height: 24),
            const Text(
              "📅 Jadwal Terbaru:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: const Text("Matematika"),
              subtitle: const Text("Senin, 08:00 - 09:30"),
              tileColor: Colors.grey.shade100,
            ),
            ListTile(
              leading: const Icon(Icons.science, color: Colors.green),
              title: const Text("IPA"),
              subtitle: const Text("Selasa, 10:00 - 11:30"),
              tileColor: Colors.grey.shade100,
            ),
          ],
        ),
      ),
    );
  }
}


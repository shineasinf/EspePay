import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  final String studentName;

  const AttendancePage({super.key, required this.studentName}); // ← tambahkan parameter

  @override
  Widget build(BuildContext context) {
    final attendance = [
      {'date': '01 Okt', 'subject': 'Matematika', 'status': 'Hadir'},
      {'date': '01 Okt', 'subject': 'Bahasa Indonesia', 'status': 'Hadir'},
      {'date': '02 Okt', 'subject': 'IPA', 'status': 'Izin'},
    ];

    Color _statusColor(String status) {
      switch (status) {
        case 'Hadir':
          return Colors.green;
        case 'Izin':
          return Colors.orange;
        case 'Alfa':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Absensi - $studentName')),
      body: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          final a = attendance[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.check_circle, color: _statusColor(a['status']!)),
              title: Text('${a['subject']}'),
              subtitle: Text('Tanggal: ${a['date']}'),
              trailing: Text(a['status']!, style: TextStyle(color: _statusColor(a['status']!))),
            ),
          );
        },
      ),
    );
  }
}


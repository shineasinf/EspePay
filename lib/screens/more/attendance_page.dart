import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = List.generate(7, (i) => {
          'date': '2025-09-${10 + i}',
          'in': '07:50',
          'out': i % 2 == 0 ? '15:00' : '-',
        });

    return Scaffold(
      appBar: AppBar(title: const Text('Rekap Presensi')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: rows
            .map((r) => Card(
                  child: ListTile(
                    title: Text(r['date']!),
                    subtitle:
                        Text('Masuk: ${r['in']} • Pulang: ${r['out']}'),
                  ),
                ))
            .toList(),
      ),
    );
  }
}


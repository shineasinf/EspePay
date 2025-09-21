import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      'Tagihan Januari belum dibayar',
      'Rapat orang tua: Jumat 10:00',
      'Reschedule Kegiatan ekstrakurikuler Renang',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notes.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (c, i) => ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(notes[i]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Detail notifikasi: ${notes[i]}")),
            );
          },
        ),
      ),
    );
  }
}


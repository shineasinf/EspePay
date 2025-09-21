// lib/screens/more/announcements_page.dart
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      'Libur Nasional: 17 Agustus',
      'Pembagian rapor: Jumat, 28 Nov',
      'Donasi pembangunan: hubungi bendahara'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pengumuman')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notes.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (c, i) => ListTile(
          leading: const Icon(Icons.announcement),
          title: Text(notes[i]),
        ),
      ),
    );
  }
}


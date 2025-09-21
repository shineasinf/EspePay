import 'package:flutter/material.dart';

class LearningResourcesPage extends StatelessWidget {
  const LearningResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Materi Matematika SMA',
      'Video Fisika',
      'Latihan Kimia'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Materi Pembelajaran')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (c, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(items[i]),
            trailing: const Icon(Icons.open_in_new),
          ),
        ),
      ),
    );
  }
}


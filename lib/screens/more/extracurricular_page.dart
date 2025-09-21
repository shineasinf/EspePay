import 'package:flutter/material.dart';

class ExtracurricularPage extends StatelessWidget {
  const ExtracurricularPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = ['Basket', 'Pramuka', 'KIR'];

    return Scaffold(
      appBar: AppBar(title: const Text('Ekstrakurikuler')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: activities
            .map((a) => Card(
                  child: ListTile(
                    title: Text(a),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ))
            .toList(),
      ),
    );
  }
}


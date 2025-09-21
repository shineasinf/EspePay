import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class MessagesCompact extends StatelessWidget {
  final Role role;
  const MessagesCompact({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        "from": "Teacher A",
        "content": "Don’t forget the homework tomorrow!",
        "time": "09:15"
      },
      {
        "from": "School Admin",
        "content": "Parent meeting scheduled on Monday.",
        "time": "Yesterday"
      },
      {
        "from": "Student B",
        "content": "Can we study together later?",
        "time": "2d ago"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final msg = messages[index];
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(msg["from"]!),
            subtitle: Text(msg["content"]!),
            trailing: Text(
              msg["time"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Opening chat with ${msg["from"]}...")),
              );
            },
          );
        },
      ),
    );
  }
}


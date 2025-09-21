import 'package:flutter/material.dart';
import '../../role.dart';
import '../home/home_screen.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Login as:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.family_restroom),
              label: const Text("Parent"),
              onPressed: () => _goHome(context, Role.parent),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.school),
              label: const Text("Student"),
              onPressed: () => _goHome(context, Role.student),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text("Teacher"),
              onPressed: () => _goHome(context, Role.teacher),
            ),
          ],
        ),
      ),
    );
  }

  void _goHome(BuildContext context, Role role) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(role: role)),
    );
  }
}


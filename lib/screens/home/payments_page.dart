import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class PaymentsPage extends StatelessWidget {
  final Role role;
  const PaymentsPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    if (role != Role.parent) {
      return const Scaffold(
        body: Center(child: Text("Payments available for parents only.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Payments")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Text("Tuition Fee - September"),
              subtitle: const Text("Due: 30 Sept 2025"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Redirecting to payment...")),
                  );
                },
                child: const Text("Pay"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Books & Materials"),
              subtitle: const Text("Paid"),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}


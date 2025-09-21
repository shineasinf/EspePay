import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class StudentDashboard extends StatelessWidget {
  final Role role;
  const StudentDashboard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Student Dashboard",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class TeacherDashboard extends StatelessWidget {
  final Role role;
  const TeacherDashboard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Teacher Dashboard",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:xolana/role.dart';
import 'package:xolana/screens/home/dashboard_parent.dart';
import 'package:xolana/screens/home/dashboard_student.dart';
import 'package:xolana/screens/home/dashboard_teacher.dart';

class HomeScreen extends StatefulWidget {
  final Role role;

  const HomeScreen({super.key, required this.role});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    switch (widget.role) {
      case Role.parent:
        // Parent Dashboard
        return const ParentDashboard(parentName: "Wijaya");

      case Role.student:
        // Student Dashboard
        return StudentDashboard(role: widget.role);

      case Role.teacher:
        // Teacher Dashboard
        return TeacherDashboard(role: widget.role);

      default:
        return const Scaffold(
          body: Center(child: Text("Role tidak dikenal")),
        );
    }
  }
}


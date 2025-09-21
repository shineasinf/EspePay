import 'package:flutter/material.dart';
import '../../role.dart';
import '../../theme/app_theme.dart';
import 'dashboard_parent.dart';
import 'dashboard_student.dart';
import 'dashboard_teacher.dart';

class HomeScreen extends StatefulWidget {
  final Role role;

  const HomeScreen({super.key, required this.role});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isParent = widget.role == Role.parent;
    final isStudent = widget.role == Role.student;
    final isTeacher = widget.role == Role.teacher;

    final pages = [
      if (isParent)
        ParentDashboard(
          role: widget.role,
          parentName: "Wijaya",
        ),
      if (isStudent) StudentDashboard(role: widget.role),
      if (isTeacher) TeacherDashboard(role: widget.role),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: XolanaColors.xRed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "Payments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Practice",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
    );
  }
}


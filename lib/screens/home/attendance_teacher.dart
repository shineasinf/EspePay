import 'package:flutter/material.dart';
import 'package:xolana/role.dart';

class AttendanceForTeacherPage extends StatefulWidget {
  final Role role;
  const AttendanceForTeacherPage({super.key, required this.role});

  @override
  State<AttendanceForTeacherPage> createState() => _AttendanceForTeacherPageState();
}

class _AttendanceForTeacherPageState extends State<AttendanceForTeacherPage> {
  final List<Map<String, dynamic>> students = [
    {"name": "Alif", "present": false},
    {"name": "Nadia", "present": false},
    {"name": "Rafi", "present": false},
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.role != Role.teacher) {
      return const Scaffold(
        body: Center(child: Text("Attendance available for teachers only.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: student["present"] ? Colors.blue : Colors.grey,
              ),
              title: Text(student["name"]),
              subtitle: Text(student["present"] ? "Present" : "Not Present"),
              trailing: Switch(
                value: student["present"],
                onChanged: (val) {
                  setState(() {
                    students[index]["present"] = val;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


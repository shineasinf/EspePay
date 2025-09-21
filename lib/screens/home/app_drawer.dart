import 'package:flutter/material.dart';
import 'package:xolana/role.dart';
import 'package:xolana/screens/more/announcements_page.dart';
import 'package:xolana/screens/more/report_card_page.dart';
import 'package:xolana/screens/more/learning_resources_page.dart';
import 'package:xolana/screens/more/attendance_page.dart';
import 'package:xolana/screens/more/profile_page.dart';
import 'package:xolana/screens/login/login_page.dart';

class AppDrawer extends StatelessWidget {
  final Role role;
  const AppDrawer({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Xolana School',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('admin@xolana.app',
                          style: TextStyle(color: Colors.white70)),
                    ],
                  )
                ],
              ),
            ),
            if (role == Role.parent) ...[
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text('Pengumuman'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Rapor'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportCardPage()),
                ),
              ),
            ],
            if (role == Role.student) ...[
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text('Pembelajaran'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LearningResourcesPage()),
                ),
              ),
            ],
            if (role == Role.teacher) ...[
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text('Pengumuman'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.check_box),
                title: const Text('Absensi Siswa'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AttendancePage()),
                ),
              ),
            ],
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),


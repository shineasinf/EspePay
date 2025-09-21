import 'package:flutter/material.dart';
import 'package:xolana/role.dart';
import '../more/announcements_page.dart';
import '../more/schedule_page.dart';
import '../more/attendance_page.dart';
import '../more/extracurricular_page.dart';
import '../more/learning_resources_page.dart';
import '../more/report_card_page.dart';
import '../more/notifications_page.dart';
import '../more/profile_page.dart';

class MorePage extends StatelessWidget {
  final Role role;
  const MorePage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {"title": "Announcements", "icon": Icons.announcement, "page": const AnnouncementsPage()},
      {"title": "Schedule", "icon": Icons.schedule, "page": const SchedulePage()},
      {"title": "Attendance", "icon": Icons.checklist, "page": const AttendancePage()},
      {"title": "Extracurricular", "icon": Icons.sports_soccer, "page": const ExtracurricularPage()},
      {"title": "Learning Resources", "icon": Icons.menu_book, "page": const LearningResourcesPage()},
      {"title": "Report Card", "icon": Icons.bar_chart, "page": const ReportCardPage()},
      {"title": "Notifications", "icon": Icons.notifications, "page": const NotificationsPage()},
      {"title": "Profile", "icon": Icons.person, "page": const ProfilePage()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("More")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: menuItems.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            leading: Icon(item["icon"] as IconData),
            title: Text(item["title"] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item["page"] as Widget),
              );
            },
          );
        },
      ),
    );
  }
}


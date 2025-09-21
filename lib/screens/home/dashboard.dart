import 'package:flutter/material.dart';
import 'package:xolana/role.dart';
import 'practice_page.dart';
import '../more/learning_resources_page.dart';
import '../more/announcements_page.dart';
import '../more/report_card_page.dart';
import '../home/attendance_teacher.dart';
import '../more/attendance_page.dart';

class Dashboard extends StatelessWidget {
  final Role role;
  const Dashboard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    if (role == Role.parent) return const ParentDashboard();
    if (role == Role.student) return const StudentDashboardSummary();
    return const TeacherDashboardSummary();
  }
}

// ---------------- Parent Dashboard ----------------
class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final children = [
      {
        'name': 'Alif',
        'spp': 'Lunas',
        'absen': 'Hadir',
        'school': 'SMA 1 Jakarta',
        'class': '10 IPA 1'
      },
      {
        'name': 'Nadia',
        'spp': 'Belum Bayar',
        'absen': 'Sakit',
        'school': 'SMA 2 Bandung',
        'class': '11 IPS 2'
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Ringkasan Anak",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        ...children.map((c) => Card(
              child: ListTile(
                title: Text(c['name']!),
                subtitle: Text("${c['school']} • Kelas ${c['class']}"),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("SPP: ${c['spp']!}",
                        style: TextStyle(
                            color: c['spp'] == 'Lunas'
                                ? Colors.green
                                : Colors.orange)),
                    Text("Absensi: ${c['absen']!}"),
                  ],
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Detail anak: ${c['name']}")),
                  );
                },
              ),
            )),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text("Pengumuman Sekolah"),
            subtitle: const Text("Libur nasional: 17 Agustus"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------- Student Dashboard ----------------
class StudentDashboardSummary extends StatelessWidget {
  const StudentDashboardSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text("Nama: Alif"),
            subtitle: const Text("SMA 1 Jakarta • Kelas 10 IPA 1"),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Practice Matematika (SMA)"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PracticePage(role: Role.student),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text("Pembelajaran"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LearningResourcesPage()),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------- Teacher Dashboard ----------------
class TeacherDashboardSummary extends StatelessWidget {
  const TeacherDashboardSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Guru: Ibu Siti"),
            subtitle: const Text("SMA Contoh • Wali Kelas 10 IPA 1"),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Absensi Siswa"),
            subtitle: const Text("Input & edit absensi harian"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AttendanceForTeacherPage(role: Role.teacher)),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text("Pengumuman"),
            subtitle: const Text("Buat pengumuman ke wali murid"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
            ),
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xolana/role.dart';
import 'student_detail_screen.dart';
import 'package:xolana/theme/app_theme.dart';

class ParentDashboard extends StatefulWidget {
  final Role role;
  final String parentName;

  const ParentDashboard({
    super.key,
    required this.role,
    this.parentName = "Wijaya",
  });

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _currentIndex = 0;

  final List<Map<String, String>> students = [
    {"name": "Bayu Perdana Putra", "class": "3A"},
    {"name": "Inggrid Zyra Aeryn", "class": "1A"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XolanaColors.xRed,
        title: Row(
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: Lottie.asset(
                'assets/icons/xolana_icon.json',
                repeat: true,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Hai, ${widget.parentName}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/icons/default_profile.png"),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Anak Anda",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Accordion List Anak
          ...students.map((s) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ExpansionTile(
                leading: const Icon(Icons.person, color: XolanaColors.xRed),
                title: Text(s["name"]!),
                subtitle: Text("Kelas ${s["class"]}"),
                children: [
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.blue),
                    title: const Text("Laporan Nilai"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StudentDetailScreen(
                            name: s["name"]!,
                            studentClass: s["class"]!,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.event, color: Colors.green),
                    title: const Text("Jadwal"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.orange),
                    title: const Text("Absensi"),
                    onTap: () {},
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: XolanaColors.xRed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: "Pembayaran",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Pesan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Lainnya",
          ),
        ],
      ),
    );
  }
}


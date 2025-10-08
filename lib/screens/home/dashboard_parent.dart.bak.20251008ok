///3 oct 2025
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xolana/theme/app_theme.dart';
import 'package:xolana/screens/home/payments_page.dart';
import 'payments_summary_page.dart';

class ParentDashboard extends StatefulWidget {
  final String parentName;
  const ParentDashboard({super.key, required this.parentName});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _currentIndex = 0;

  /// 🔥 Data anak + status pembayaran
  final List<Map<String, String>> children = [
    {
      'name': 'Bayu Perdana Putra',
      'class': 'Kelas 3A',
      'status': 'LUNAS',
    },
    {
      'name': 'Inggrid Zyra Aeryn',
      'class': 'Kelas 1A',
      'status': 'BELUM BAYAR',
    },
  ];

  final List<Map<String, String>> announcements = [
    {
      'title': 'Pengumuman Libur',
      'content': 'Sekolah libur hari Jumat untuk kegiatan internal.'
    },
    {
      'title': 'Kegiatan Pramuka',
      'content': 'Sabtu ada latihan pramuka pukul 07.00 di lapangan.'
    },
  ];

  final List<Map<String, String>> agenda = [
    {'date': '28 Feb', 'event': 'Ujian Tengah Semester'},
    {'date': '2 Mar', 'event': 'Rapat Orang Tua'},
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'LUNAS':
        return Colors.green;
      case 'PENDING':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: XolanaColors.xRed,
        title: Row(
          children: [
            Lottie.asset(
              'assets/icons/xolana_icon.json',
              height: 36,
              repeat: true,
            ),
            const SizedBox(width: 8),
            Text(
              'Hai, ${widget.parentName}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'W', // in real case -> inisial ortu
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Anak Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...children.map((child) => _buildChildCard(child)).toList(),
            const SizedBox(height: 20),

            const Text(
              "Pengumuman Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...announcements.map((a) => _buildAnnouncementCard(a)).toList(),
            const SizedBox(height: 20),

            const Text(
              "Agenda Penting",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...agenda.map((a) => _buildAgendaItem(a)).toList(),
            const SizedBox(height: 20),

            const Text(
              "Aksi Cepat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAction(Icons.payment, "Bayar SPP"),
                _buildQuickAction(Icons.event_busy, "Izin"),
                _buildQuickAction(Icons.chat, "Hubungi Guru"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: XolanaColors.xRed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
  setState(() {
    _currentIndex = index;
  });
  if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PaymentsSummaryPage(),
      ),
    );
  }
},

	items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Practice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget _buildChildCard(Map<String, String> child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: const Icon(Icons.person, color: Colors.red),
        title: Text(child['name'] ?? ''),
        subtitle: Text(child['class'] ?? ''),
        children: [
          ListTile(
            leading: const Icon(Icons.book, color: Colors.blue),
            title: const Text("Laporan Nilai"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.green),
            title: const Text("Jadwal"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.orange),
            title: const Text("Absensi"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.payment, color: Colors.purple),
            title: const Text("Status Pembayaran"),
            trailing: Text(
              child['status'] ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _statusColor(child['status'] ?? ''),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentsPage(
                    studentName: child['name'] ?? '',
                    status: child['status'] ?? 'BELUM DIBAYAR',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(Map<String, String> a) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.campaign, color: Colors.deepPurple),
        title: Text(a['title'] ?? ''),
        subtitle: Text(a['content'] ?? ''),
      ),
    );
  }

  Widget _buildAgendaItem(Map<String, String> a) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.teal),
        title: Text(a['event'] ?? ''),
        subtitle: Text("Tanggal: ${a['date']}"),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: XolanaColors.xRed.withOpacity(0.1),
          child: Icon(icon, color: XolanaColors.xRed),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}


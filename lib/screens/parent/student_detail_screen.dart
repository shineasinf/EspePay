import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StudentDetailScreen extends StatelessWidget {
  final String name;
  final String kelas;

  const StudentDetailScreen({
    super.key,
    required this.name,
    required this.kelas,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: XolanaColors.xRed,
          title: Text(name),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.check_circle), text: "Absensi"),
              Tab(icon: Icon(Icons.payment), text: "Pembayaran"),
              Tab(icon: Icon(Icons.assignment), text: "Rapor"),
              Tab(icon: Icon(Icons.menu_book), text: "Media"),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: XolanaColors.xRed.withOpacity(0.1),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(kelas),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // Tab Absensi
                  _AbsensiTab(),
                  // Tab Pembayaran
                  _PembayaranTab(),
                  // Tab Rapor
                  _RaporTab(),
                  // Tab Media
                  _MediaTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AbsensiTab extends StatelessWidget {
  const _AbsensiTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.today),
          title: Text("Senin, 20 Januari 2025"),
          trailing: Text("Hadir"),
        ),
        ListTile(
          leading: Icon(Icons.today),
          title: Text("Selasa, 21 Januari 2025"),
          trailing: Text("Izin"),
        ),
      ],
    );
  }
}

class _PembayaranTab extends StatelessWidget {
  const _PembayaranTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text("SPP Januari 2025"),
          subtitle: Text("Rp 500.000"),
          trailing: Text("Sudah dibayar"),
        ),
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text("SPP Februari 2025"),
          subtitle: Text("Rp 500.000"),
          trailing: Text("Belum dibayar"),
        ),
      ],
    );
  }
}

class _RaporTab extends StatelessWidget {
  const _RaporTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Belum ada rapor"),
    );
  }
}

class _MediaTab extends StatelessWidget {
  const _MediaTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Belum ada materi pembelajaran"),
    );
  }
}


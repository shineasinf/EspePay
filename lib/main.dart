// espepay_main.dart
// Edu-tech mobile-first mockup for EspePay
// Flutter stable + null-safety

import 'package:flutter/material.dart';

void main() => runApp(EspePayApp());

class EspePayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EspePay',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: RoleSelectScreen(),
    );
  }
}

ThemeData _buildLightTheme() {
  const burgundy = Color(0xFF800020);
  const accent = Color(0xFF1976D2);
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: burgundy, primary: burgundy, secondary: accent),
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: const AppBarTheme(backgroundColor: burgundy, foregroundColor: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: burgundy),
    cardTheme: const CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))), elevation: 2),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData _buildDarkTheme() {
  const burgundy = Color(0xFF800020);
  const accent = Color(0xFF1976D2);
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(primary: burgundy, secondary: accent),
    appBarTheme: const AppBarTheme(backgroundColor: burgundy, foregroundColor: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: burgundy),
  );
}

// -------------------- Role select (Parent / Student / Teacher) --------------------
class RoleSelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Text('EspePay', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Aplikasi pembayaran & manajemen sekolah — untuk orang tua, siswa, dan guru.', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 28),

              _RoleCard(title: 'Wali Murid / Orang Tua', subtitle: 'Lihat tagihan SPP, rapor, chat wali kelas', icon: Icons.family_restroom, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(role: Role.parent)))),
              const SizedBox(height: 12),
              _RoleCard(title: 'Siswa', subtitle: 'Lihat jadwal, materi, ekstrakurikuler', icon: Icons.school, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(role: Role.student)))),
              const SizedBox(height: 12),
              _RoleCard(title: 'Guru / Wali Kelas', subtitle: 'Kelola presensi, nilai, pengumuman', icon: Icons.person_search, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(role: Role.teacher)))),

              const Spacer(),
              Text('Demo: tekan role untuk masuk ke mockup', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final VoidCallback onTap;
  const _RoleCard({required this.title, required this.subtitle, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primaryContainer, child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

enum Role { parent, student, teacher }

// -------------------- HomeScreen with tabs --------------------
class HomeScreen extends StatefulWidget {
  final Role role;
  const HomeScreen({required this.role});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final title = widget.role == Role.parent ? 'Dashboard - Orang Tua' : widget.role == Role.student ? 'Dashboard - Siswa' : 'Dashboard - Guru';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsPage()))),
          IconButton(icon: const Icon(Icons.person), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()))),
        ],
      ),
      drawer: _AppDrawer(role: widget.role),
      body: IndexedStack(index: _index, children: [
        Dashboard(role: widget.role),
        PaymentsPageCompact(role: widget.role),
        MessagesCompact(role: widget.role),
        MorePage(role: widget.role),
      ]),
      bottomNavigationBar: NavigationBar(selectedIndex: _index, onDestinationSelected: (i) => setState(() => _index = i), destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.payment_outlined), label: 'Payments'),
        NavigationDestination(icon: Icon(Icons.message_outlined), label: 'Chat'),
        NavigationDestination(icon: Icon(Icons.grid_view_outlined), label: 'More'),
      ]),
      floatingActionButton: _index == 1 ? FloatingActionButton.extended(icon: const Icon(Icons.add), label: const Text('Bayar'), onPressed: () {}) : null,
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final Role role;
  const _AppDrawer({required this.role});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Row(children: [
                CircleAvatar(radius: 36, backgroundColor: Colors.white, child: Icon(Icons.school, color: Theme.of(context).colorScheme.primary)),
                const SizedBox(width: 12),
                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: const [
                  Text('SDN Contoh', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('admin@sekolah.id', style: TextStyle(color: Colors.white70)),
                ])
              ]),
            ),
            ListTile(leading: const Icon(Icons.announcement), title: const Text('Pengumuman'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnnouncementsPage()))),
            ListTile(leading: const Icon(Icons.school), title: const Text('Rapor'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportCardPage()))),
            ListTile(leading: const Icon(Icons.schedule), title: const Text('Jadwal Pelajaran'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SchedulePage()))),
            ListTile(leading: const Icon(Icons.groups), title: const Text('Ekstrakurikuler'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExtracurricularPage()))),
            ListTile(leading: const Icon(Icons.check_box_outlined), title: const Text('Rekap Presensi'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AttendancePage()))),
            const Spacer(),
            ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: () {}),
          ],
        ),
      ),
    );
  }
}

// -------------------- Dashboard --------------------
class Dashboard extends StatelessWidget {
  final Role role;
  const Dashboard({required this.role});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(padding: const EdgeInsets.all(16), children: [
        _WelcomeCard(role: role),
        const SizedBox(height: 12),
        _SummaryRow(),
        const SizedBox(height: 12),
        _Section(title: 'Tagihan Terbaru', child: _PaymentsList()),
        const SizedBox(height: 12),
        _Section(title: 'Pengumuman Sekolah', child: _AnnouncementsPreview()),
        const SizedBox(height: 12),
        _Section(title: 'Jadwal Hari Ini', child: _SchedulePreview()),
      ]),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  final Role role;
  const _WelcomeCard({required this.role});
  @override
  Widget build(BuildContext context) {
    final name = role == Role.parent ? 'Orang Tua (Budi)' : role == Role.student ? 'Siswa (Budi)' : 'Guru (Ibu Siti)';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          CircleAvatar(radius: 30, backgroundColor: Theme.of(context).colorScheme.primaryContainer, child: Icon(Icons.person, size: 30, color: Theme.of(context).colorScheme.onPrimaryContainer)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height: 6), const Text('Selamat datang di EspePay — kelola pembayaran & aktivitas sekolah di sini.')])),
        ]),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(child: _TinyCard(title: 'Total Tagihan', value: 'IDR 1.450.000')),
      SizedBox(width: 10),
      Expanded(child: _TinyCard(title: 'Terbayar', value: 'IDR 1.100.000')),
      SizedBox(width: 10),
      Expanded(child: _TinyCard(title: 'Telat', value: 'IDR 350.000')),
    ]);
  }
}

class _TinyCard extends StatelessWidget {
  final String title, value;
  const _TinyCard({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 12)), const SizedBox(height: 8), Text(value, style: const TextStyle(fontWeight: FontWeight.bold))])),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 8), Card(child: Padding(padding: const EdgeInsets.all(12), child: child))]);
  }
}

class _PaymentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sample = List.generate(4, (i) => {'title': 'SPP Bulan ${i + 1}', 'amount': 'IDR 350.000', 'status': i % 3 == 0 ? 'Lunas' : i % 3 == 1 ? 'Belum Bayar' : 'Telat'});
    return Column(children: sample.map((p) => ListTile(leading: const Icon(Icons.receipt_long), title: Text(p['title']!), subtitle: Text(p['amount']! + ' • ' + p['status']!), trailing: p['status'] == 'Lunas' ? const Icon(Icons.check_circle, color: Colors.green) : p['status'] == 'Telat' ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.hourglass_empty, color: Colors.orange), onTap: () {})).toList());
  }
}

class _AnnouncementsPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [ListTile(leading: const Icon(Icons.campaign), title: const Text('Libur Nasional: Hari Kemerdekaan'), subtitle: const Text('Tanggal 17 Agustus libur semua sekolah')), ListTile(leading: const Icon(Icons.info_outline), title: const Text('Pembagian Rapor'), subtitle: const Text('Rapor dibagikan pada minggu depan'))]);
  }
}

class _SchedulePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [ListTile(leading: const Icon(Icons.schedule), title: const Text('08:00 - 09:30'), subtitle: const Text('Matematika')), ListTile(leading: const Icon(Icons.schedule), title: const Text('09:45 - 11:15'), subtitle: const Text('Bahasa Indonesia'))]);
  }
}

// -------------------- Payments compact page --------------------
class PaymentsPageCompact extends StatelessWidget {
  final Role role;
  const PaymentsPageCompact({required this.role});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      const SizedBox(height: 6),
      Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Bayar SPP', style: TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text('Pilih metode pembayaran: QR, Transfer, atau Kartu')]))),
      const SizedBox(height: 12),
      ...List.generate(6, (i) => Card(margin: const EdgeInsets.only(bottom: 10), child: ListTile(leading: CircleAvatar(child: Text('S${i+1}')), title: Text('SPP Bulan ${i+1}'), subtitle: Text('IDR ${300000 + i*25000}'), trailing: Text(i%3==0 ? 'Lunas' : i%3==1 ? 'Belum' : 'Telat'))))
    ]);
  }
}

// -------------------- Messages compact --------------------
class MessagesCompact extends StatelessWidget {
  final Role role;
  const MessagesCompact({required this.role});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: 'Cari pesan/ortu...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      const SizedBox(height: 10),
      ...List.generate(8, (i) => ListTile(leading: CircleAvatar(child: Text('P${i+1}')), title: Text('Orang Tua ${i+1}'), subtitle: Text('Pertanyaan mengenai pembayaran'), trailing: const Text('1h')))
    ]);
  }
}

// -------------------- More page includes many features --------------------
class MorePage extends StatelessWidget {
  final Role role;
  const MorePage({required this.role});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      ListTile(leading: const Icon(Icons.campaign), title: const Text('Pengumuman & Agenda'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnnouncementsPage()))),
      ListTile(leading: const Icon(Icons.book), title: const Text('Materi Pembelajaran'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LearningResourcesPage()))),
      ListTile(leading: const Icon(Icons.grade), title: const Text('Rapor & Nilai'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportCardPage()))),
      ListTile(leading: const Icon(Icons.schedule), title: const Text('Jadwal Pelajaran'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SchedulePage()))),
      ListTile(leading: const Icon(Icons.event), title: const Text('Jadwal Ekstrakurikuler'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExtracurricularPage()))),
      ListTile(leading: const Icon(Icons.check_box), title: const Text('Rekap Presensi'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AttendancePage()))),
    ]);
  }
}

// -------------------- Announcements --------------------
class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = [
      'Libur Nasional: 17 Agustus',
      'Pembagian rapor: Jumat, 28 Nov',
      'Donasi pembangunan: hubungi bendahara',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Pengumuman')),
      body: ListView.separated(padding: const EdgeInsets.all(12), itemCount: notes.length, separatorBuilder: (_,__)=>const Divider(), itemBuilder: (c,i)=>ListTile(leading: const Icon(Icons.announcement), title: Text(notes[i]))),
    );
  }
}

// -------------------- Learning resources --------------------
class LearningResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = ['Materi Matematika', 'Video Bahasa Indonesia', 'Latihan IPA'];
    return Scaffold(
      appBar: AppBar(title: const Text('Materi Pembelajaran')),
      body: ListView.builder(padding: const EdgeInsets.all(12), itemCount: items.length, itemBuilder: (c,i)=>Card(child: ListTile(leading: const Icon(Icons.menu_book), title: Text(items[i]), trailing: const Icon(Icons.open_in_new))))
    );
  }
}

// -------------------- Report card --------------------
class ReportCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subjects = {'Matematika': 'A', 'Bahasa Indonesia': 'B+', 'IPA': 'A-'};
    return Scaffold(
      appBar: AppBar(title: const Text('Rapor')),
      body: ListView(padding: const EdgeInsets.all(12), children: [Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Rapor Semester 1', style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 12), ...subjects.entries.map((e)=>ListTile(title: Text(e.key), trailing: Text(e.value))).toList()])))]),
    );
  }
}

// -------------------- Schedule --------------------
class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule = ['08:00 Matematika', '09:30 Bahasa', '11:00 IPA'];
    return Scaffold(appBar: AppBar(title: const Text('Jadwal Pelajaran')), body: ListView(padding: const EdgeInsets.all(12), children: schedule.map((s)=>Card(child: ListTile(title: Text(s)))).toList()));
  }
}

// -------------------- Extracurricular --------------------
class ExtracurricularPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities = ['Basket', 'Pramuka', 'Seni Tari'];
    return Scaffold(appBar: AppBar(title: const Text('Ekstrakurikuler')), body: ListView(padding: const EdgeInsets.all(12), children: activities.map((a)=>Card(child: ListTile(title: Text(a), trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: (){}))).toList()));
  }
}

// -------------------- Attendance --------------------
class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = List.generate(7, (i) => {'date': '2025-09-${10+i}', 'in': '07:50', 'out': i%2==0 ? '15:00' : '-'});
    return Scaffold(appBar: AppBar(title: const Text('Rekap Presensi')), body: ListView(padding: const EdgeInsets.all(12), children: rows.map((r)=>Card(child: ListTile(title: Text(r['date']!), subtitle: Text('Masuk: ${r['in']} • Pulang: ${r['out']}')))).toList()));
  }
}

// -------------------- Notifications & Profile --------------------
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = ['Tagihan Januari belum dibayar', 'Rapat orang tua: Jumat 10:00', 'Kegiatan ekstrakurikuler: Jumat'];
    return Scaffold(appBar: AppBar(title: const Text('Notifikasi')), body: ListView.separated(padding: const EdgeInsets.all(12), itemCount: notes.length, separatorBuilder: (_,__)=>const Divider(), itemBuilder: (c,i)=>ListTile(leading: const Icon(Icons.notifications), title: Text(notes[i]))));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Profil')), body: ListView(padding: const EdgeInsets.all(12), children: [Card(child: ListTile(leading: const Icon(Icons.person), title: const Text('Dedy K Wijaya'), subtitle: const Text('dkwijaya.gin@gmail.com'))), Card(child: ListTile(leading: const Icon(Icons.settings), title: const Text('Pengaturan Akun')))]));
  }
}

// End of mockup


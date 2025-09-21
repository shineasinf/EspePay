import 'package:flutter/material.dart';
import 'package:xolana/screens/login/login_page.dart';

/// Global notifier buat ganti tema (didefinisikan di main.dart)
import 'package:xolana/theme/theme_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Dedy K Wijaya'),
              subtitle: const Text('dkwijaya.gin@gmail.com'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan Akun'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Menu Pengaturan Akun (dummy)")),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                brightness == Brightness.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              title: Text(
                brightness == Brightness.light
                    ? 'Ke Dark Mode'
                    : 'Ke Light Mode',
              ),
              onTap: () {
                // Toggle theme mode via notifier
                if (themeModeNotifier.value == ThemeMode.light) {
                  themeModeNotifier.value = ThemeMode.dark;
                } else {
                  themeModeNotifier.value = ThemeMode.light;
                }
                setState(() {});
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


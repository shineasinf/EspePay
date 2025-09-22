import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  final String studentName;
  final String status; // 👈 tambahan

  const PaymentsPage({
    super.key,
    required this.studentName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // contoh data historis pembayaran
    final List<Map<String, dynamic>> payments = [
      {
        'title': 'SPP Juli 2025',
        'amount': 500000,
        'status': 'LUNAS',
      },
      {
        'title': 'SPP Agustus 2025',
        'amount': 500000,
        'status': status == 'PENDING' ? 'PENDING' : 'LUNAS',
      },
      {
        'title': 'Iuran Ekstra Renang',
        'amount': 200000,
        'status': status == 'PENDING' ? 'BELUM BAYAR' : 'LUNAS',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran - $studentName'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: payments.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final p = payments[index];
          final color = p['status'] == 'LUNAS'
              ? Colors.green
              : (p['status'] == 'PENDING'
                  ? Colors.orange
                  : Colors.red);

          return Card(
            child: ListTile(
              leading: Icon(
                Icons.receipt_long,
                color: color,
              ),
              title: Text(p['title']),
              subtitle: Text("Rp ${p['amount']}"),
              trailing: Text(
                p['status'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


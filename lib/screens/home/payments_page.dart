import 'package:flutter/material.dart';
import 'payment_detail_page.dart';

class PaymentsPage extends StatelessWidget {
  final String studentName;
  final String? status;

  const PaymentsPage({
    super.key,
    required this.studentName,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> payments = [
      {
        "title": "SPP Juli 2025",
        "amount": 500000,
        "status": "LUNAS",
        "method": "QRIS",
        "trxId": "TRX001",
        "merchantOrderId": "ORD001",
        "paidAt": DateTime(2025, 7, 5, 10, 30),
      },
      {
        "title": "SPP Agustus 2025",
        "amount": 500000,
        "status": "PENDING",
        "method": "Gopay",
        "trxId": "TRX002",
        "merchantOrderId": "ORD002",
        "paidAt": DateTime(2025, 8, 2, 14, 15),
      },
      {
        "title": "SPP September 2025",
        "amount": 500000,
        "status": "BELUM BAYAR",
      },
      {
        "title": "SPP Oktober 2025",
        "amount": 500000,
        "status": "BELUM BAYAR",
      },
      {
        "title": "SPP November 2025",
        "amount": 500000,
        "status": "BELUM BAYAR",
      },
      {
        "title": "Iuran Ekstrakurikuler Basket",
        "amount": 200000,
        "status": "LUNAS",
        "trxId": "TRX010",
        "merchantOrderId": "ORD010",
        "method": "Dana",
        "paidAt": DateTime(2025, 9, 1, 8, 00),
      },
      {
        "title": "Iuran Ekstrakurikuler Musik",
        "amount": 250000,
        "status": "PENDING",
      },
      {
        "title": "LKS Kelas 3 Semester Ganjil",
        "amount": 150000,
        "status": "LUNAS",
      },
      {
        "title": "LKS Kelas 3 Semester Genap",
        "amount": 150000,
        "status": "BELUM BAYAR",
      },
      {
        "title": "Donasi Sekolah",
        "amount": 100000,
        "status": "LUNAS",
      },
    ];

    // ✅ Override: kalau summary status di dashboard = "LUNAS", tandai semua item lunas
    if (status != null && status!.toUpperCase() == "LUNAS") {
      for (var p in payments) {
        p["status"] = "LUNAS";
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE53835),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pembayaran - $studentName",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6), // biar lingkaran nggak terlalu besar
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFE53835),
              size: 18,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: payments.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final p = payments[index];
          final status = p["status"];
          final color = status == "LUNAS"
              ? Colors.green
              : (status == "PENDING" ? Colors.orange : Colors.red);

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.receipt_long, color: color),
              title: Text(
                p["title"],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Rp ${p["amount"].toString().replaceAllMapped(
                      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                      (m) => '${m[1]}.',
                    )}",
              ),
              trailing: Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentDetailPage(
                      title: p["title"],
                      amount: p["amount"],
                      status: p["status"],
                      method: p["method"],
                      transactionId: p["trxId"],
                      merchantOrderId: p["merchantOrderId"],
                      date: p["paidAt"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


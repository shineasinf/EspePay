import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'payments_page.dart';

class PaymentsSummaryPage extends StatefulWidget {
  const PaymentsSummaryPage({super.key});

  @override
  State<PaymentsSummaryPage> createState() => _PaymentsSummaryPageState();
}

class _PaymentsSummaryPageState extends State<PaymentsSummaryPage> {
  final List<Map<String, dynamic>> children = [
    {
      'name': 'Bayu Perdana Putra',
      'shortName': 'Bayu',
      'class': 'Kelas 3A',
      'status': 'LUNAS',
      'gender': 'M',
      'total': 5000000,
      'paid': 5000000,
      'unpaid': 0,
      'itemsTotal': 10,
      'itemsPaid': 10,
      'itemsUnpaid': 0,
    },
    {
      'name': 'Inggrid Zyra Aeryn',
      'shortName': 'Inggrid',
      'class': 'Kelas 1A',
      'status': 'BELUM BAYAR',
      'gender': 'F',
      'total': 5000000,
      'paid': 4000000,
      'unpaid': 1000000,
      'itemsTotal': 10,
      'itemsPaid': 8,
      'itemsUnpaid': 2,
    }
  ];

  late Map<String, dynamic> selectedChild;

  @override
  void initState() {
    super.initState();
    selectedChild = children.first;
  }

  String _formatCurrency(int value) {
    return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }

  @override
  Widget build(BuildContext context) {
    final total = selectedChild['total'] as int;
    final paid = selectedChild['paid'] as int;
    final unpaid = selectedChild['unpaid'] as int;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE53835),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Ringkasan Pembayaran",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFE53835),
              size: 18,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // === Bagian avatar anak scroll horizontal ===
          SizedBox(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: children.map((c) {
                  final isSelected = selectedChild['name'] == c['name'];
                  return GestureDetector(
                    onTap: () => setState(() => selectedChild = c),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: isSelected ? 38 : 32,
                            backgroundColor:
                                isSelected ? Colors.red.shade100 : Colors.grey.shade200,
                            child: CircleAvatar(
                              radius: isSelected ? 34 : 28,
                              backgroundImage: AssetImage(
                                c['gender'] == 'M'
                                    ? 'assets/icons/boy.png'
                                    : 'assets/icons/girl.png',
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            c['shortName'] ?? '',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.red : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // === Konten ringkasan tagihan ===
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: const Color(0xFFFAFAF0), // putih tulang
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // animasi avatar lottie besar
                      Lottie.asset(
                        selectedChild['gender'] == 'M'
                            ? 'assets/animations/profile_avatar_boy.json'
                            : 'assets/animations/profile_avatar_girl.json',
                        height: 160, // 🔥 diperbesar
                        repeat: true,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedChild['name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        selectedChild['class'],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),

                      // angka total item
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _statNumber("${selectedChild['itemsTotal']} item",
                              "Total Tagihan"),
                          _statNumber("${selectedChild['itemsPaid']} item",
                              "Sudah Bayar"),
                          _statNumber("${selectedChild['itemsUnpaid']} item",
                              "Belum Bayar"),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Total & Sudah dibayar side by side
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text("Total Tagihan",
                                    style: TextStyle(fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(
                                  "Rp ${_formatCurrency(total)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(width: 1, height: 40, color: Colors.grey.shade300),
                            Column(
                              children: [
                                const Text("Sudah Dibayar",
                                    style: TextStyle(fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(
                                  "Rp ${_formatCurrency(paid)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "Tagihan Baru: Rp ${_formatCurrency(unpaid)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: unpaid > 0 ? Colors.red : Colors.green,
                        ),
                      ),

                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentsPage(
                                  studentName: selectedChild['name'],
                                  status: selectedChild['status'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE53835),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          icon: const Icon(Icons.receipt_long),
                          label: const Text(
                            "Lihat Tagihan",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _statNumber(String number, String label) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}


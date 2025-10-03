import 'package:flutter/material.dart';
import 'payments_page.dart';

class PaymentsSummaryPage extends StatefulWidget {
  const PaymentsSummaryPage({super.key});

  @override
  State<PaymentsSummaryPage> createState() => _PaymentsSummaryPageState();
}

class _PaymentsSummaryPageState extends State<PaymentsSummaryPage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Map<String, dynamic>> children = [
    {
      'name': 'Bayu Perdana Putra',
      'photo': 'https://i.pravatar.cc/200?img=3',
      'totalTagihan': 10,
      'totalBayar': 8,
      'totalBelum': 2,
      'totalNominal': 5000000,
      'status': 'BELUM BAYAR',
    },
    {
      'name': 'Inggrid Zyra Aeryn',
      'photo': 'https://i.pravatar.cc/200?img=5',
      'totalTagihan': 5,
      'totalBayar': 5,
      'totalBelum': 0,
      'totalNominal': 2500000,
      'status': 'LUNAS',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: children.length,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (context, index) {
                final c = children[index];
                return AnimatedScale(
                  scale: index == _currentPage ? 1 : 0.95,
                  duration: const Duration(milliseconds: 300),
                  child: _buildChildSummaryCard(c),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(children.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFFE53835)
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildChildSummaryCard(Map<String, dynamic> c) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Foto anak
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                c['photo'],
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            // Nama anak
            Text(
              c['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Ringkasan tagihan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _infoBox("Total Tagihan", "${c['totalTagihan']} item"),
                _infoBox("Sudah Bayar", "${c['totalBayar']} item"),
                _infoBox("Belum Bayar", "${c['totalBelum']} item"),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              "Total: Rp ${c['totalNominal'].toString().replaceAllMapped(
                RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                (m) => '${m[1]}.',
              )}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 16),

            // Tombol lihat tagihan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentsPage(
                        studentName: c['name'],
                        status: c['status'],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.receipt_long),
                label: const Text("Lihat Tagihan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53835),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}


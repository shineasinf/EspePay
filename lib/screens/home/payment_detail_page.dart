import 'package:flutter/material.dart';
import 'support_chat_page.dart';

class PaymentDetailPage extends StatelessWidget {
  final String title; // perihal pembayaran, ex: "SPP Juli 2025"
  final String status; // LUNAS, PENDING, BELUM BAYAR
  final int amount;
  final String? method;
  final String? transactionId;
  final String? merchantOrderId;
  final DateTime? date;

  const PaymentDetailPage({
    super.key,
    required this.title,
    required this.status,
    required this.amount,
    this.method,
    this.transactionId,
    this.merchantOrderId,
    this.date,
  });

  bool get isPaid => status.toUpperCase() == "LUNAS";
  bool get isPending => status.toUpperCase() == "PENDING";
  bool get isUnpaid =>
      status.toUpperCase() == "BELUM BAYAR" || status.toUpperCase() == "UNPAID";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE53835),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Transaction Detail",
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // perihal pembayaran
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ikon status
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: isPaid
                        ? Colors.green.shade100
                        : (isPending
                            ? Colors.orange.shade100
                            : Colors.red.shade100),
                    child: Icon(
                      Icons.receipt_long,
                      size: 40,
                      color: isPaid
                          ? Colors.green
                          : (isPending ? Colors.orange : Colors.red),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // status text
                  Text(
                    isPaid
                        ? "Transaction Success"
                        : (isPending
                            ? "Transaction In Progress"
                            : "Unpaid Transaction"),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isPaid
                          ? Colors.green
                          : (isPending ? Colors.orange : Colors.red),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // nominal
                  Text(
                    "Rp ${amount.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),

                  if (isUnpaid) ...[
                    Text(
                      "Mohon segera lakukan pembayaran sebelum 15 Sep 2025 untuk melunasi tagihan ini.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  if (isPaid || isPending) ...[
                    // detail box
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (method != null)
                              _kv("Payment Method", method ?? "-"),
                            if (transactionId != null)
                              _kv("Transaction ID", transactionId ?? "-"),
                            if (merchantOrderId != null)
                              _kv("Merchant Order ID", merchantOrderId ?? "-"),
                            if (date != null)
                              _kv("Date",
                                  "${date!.day} ${_monthName(date!.month)} ${date!.year} • ${date!.hour}:${date!.minute.toString().padLeft(2, '0')}"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // tombol share
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share, color: Color(0xFFE53835)),
                        label: const Text(
                          "Share",
                          style: TextStyle(
                            color: Color(0xFFE53835),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFE53835)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ] else if (isUnpaid) ...[
                    // tombol lakukan pembayaran
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          _showPaymentMethods(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color(0xFFE53835), width: 2),
                          minimumSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Lakukan Pembayaran",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE53835),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // tombol butuh bantuan
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SupportChatPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.support_agent),
                label: const Text("Butuh Bantuan ?"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53835),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(56),
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
          ),
        ],
      ),
    );
  }

  Widget _kv(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          text: "$key: ",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des"
    ];
    return months[month - 1];
  }

  void _showPaymentMethods(BuildContext context) {
    final methods = [
      {"name": "QRIS", "icon": Icons.qr_code},
      {"name": "Gopay", "icon": Icons.account_balance_wallet},
      {"name": "Dana", "icon": Icons.account_balance_wallet},
      {"name": "VA Bank", "icon": Icons.account_balance},
      {"name": "Kartu Kredit", "icon": Icons.credit_card},
      {"name": "Transfer Manual", "icon": Icons.attach_money},
    ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Text(
                "Pilih Metode Pembayaran",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...methods.map((m) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFFFEBEE), // soft red bg
                        child: Icon(
                          m["icon"] as IconData,
                          color: const Color(0xFFE53835), // brand red
                        ),
                      ),
                      title: Text(
                        m["name"] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("Metode dipilih: ${m["name"]}")),
                        );
                      },
                    ),
                  )),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}


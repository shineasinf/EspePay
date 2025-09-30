import 'package:flutter/foundation.dart';

class Payment {
  final String title;
  final int amount;
  String status;
  DateTime? paidAt;
  String? method;

  String? transactionId;     // ✅ field baru
  String? merchantOrderId;   // ✅ field baru

  Payment({
    required this.title,
    required this.amount,
    this.status = "BELUM BAYAR",
    this.paidAt,
    this.method,
    this.transactionId,
    this.merchantOrderId,
  });
}

class PaymentProvider with ChangeNotifier {
  final String studentName;
  final List<Payment> _payments = [];

  PaymentProvider(this.studentName, {String initialStatus = "BELUM BAYAR"}) {
    // contoh data dummy minimal 10
    for (int i = 1; i <= 10; i++) {
      _payments.add(Payment(
        title: "SPP Bulan $i 2025",
        amount: 500000,
        status: i < 7 ? "LUNAS" : initialStatus,
        paidAt: i < 7 ? DateTime(2025, i, 5, 10, 30) : null,
        method: i < 7 ? "Gopay" : null,
        transactionId: i < 7 ? "TRX12345678$i" : null,
        merchantOrderId: i < 7 ? "ORD8876543$i" : null,
      ));
    }
  }

  List<Payment> get payments => _payments;

  void setPending(Payment payment, String method) {
    payment.status = "PENDING";
    payment.method = method;
    notifyListeners();

    // simulasi sistem (5 detik)
    Future.delayed(const Duration(seconds: 5), () {
      final detected = DateTime.now().second % 2 == 0;
      if (detected) {
        payment.status = "LUNAS";
        payment.paidAt = DateTime.now();
        payment.transactionId =
            "TRX${DateTime.now().millisecondsSinceEpoch}";
        payment.merchantOrderId =
            "ORD${DateTime.now().millisecondsSinceEpoch}";
      } else {
        payment.status = "BELUM BAYAR";
        payment.method = null;
        payment.transactionId = null;
        payment.merchantOrderId = null;
      }
      notifyListeners();
    });
  }
}


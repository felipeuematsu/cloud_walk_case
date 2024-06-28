import 'dart:async';

import 'package:flutter/foundation.dart';

class PixPaymentViewModel extends ChangeNotifier {
  String? qrCode;

  void setPixValue(dynamic value) {
    qrCode = 'qrCode';
    notifyListeners();
  }

  Future<void> fetchInformation() async {
    // Fetch from services
    await Future.delayed(const Duration(seconds: 1));
    setPixValue(null);
  }
}

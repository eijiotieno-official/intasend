import 'package:intasend/intasend.dart';
import 'package:intasend/src/utils.dart';

class Collect {
  Future<Map<String, dynamic>> mpesaSTKPush({
    required bool test,
    required double amount,
    required String phoneNumber,
    required String name,
    required String email,
    required String narrative,
    String? walletId,
  }) async {
    final Map<String, dynamic> payload = {
      "public_key": Intasend.keys.publishableKey,
      "currency": enumStringCurrency(currency: Currency.kes),
      "method": "M-PESA",
      "amount": amount,
      "phone_number": phoneNumber,
      "api_ref": "API Request",
      "name": name,
      "email": email,
      "narrative": narrative,
      "walletId": walletId ?? "",
    };
    return await sendPostRequest(
      endPoint: "payment/mpesa-stk-push/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  Future<Map<String, dynamic>> getQuote({
    required bool test,
    required double amount,
    required String method,
  }) async {
    final Map<String, dynamic> payload = {
      "public_key": Intasend.keys.publishableKey,
      "currency": enumStringCurrency(currency: Currency.kes),
      "method": method,
      "tarrif": "BUSINESS-PAYS",
      "amount": amount.toString(),
    };
    return await sendPostRequest(
      endPoint: "payment/get_amount_estimate/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }
}

import 'package:intasend/intasend.dart';
import 'package:intasend/src/utils.dart';



class Transfer {
  Future<Map<String, dynamic>> approve({
    required bool test,
    required String provider,
    required Currency currency,
    required List transactions,
    required String callbackUrl,
    required String walletId,
  }) async {
    final Map<String, dynamic> payload = {
      'provider': provider,
      'transactions': transactions,
      'currency': enumStringCurrency(currency: currency),
      'callback_url': callbackUrl,
      'wallet_id': walletId,
    };
    return await sendPostRequest(
      endPoint: "send-money/approve/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  Future<Map<String, dynamic>> status({
    required bool test,
    required String id,
  }) async {
    final Map<String, dynamic> payload = {
      'tracking_id': id,
    };
    return await sendPostRequest(
      endPoint: "send-money/status/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  Future<Map<String, dynamic>> mpesa({
    required bool test,
    required Currency currency,
    required List transactions,
    String? callbackUrl,
    String? walletId,
  }) async {
    return await sendMoney(
      test: test,
      provider: "MPESA-B2C",
      currency: currency,
      transactions: transactions,
      callbackUrl: callbackUrl!,
      walletId: walletId!,
    );
  }

  Future<Map<String, dynamic>> mpesaB2B({
    required bool test,
    required Currency currency,
    required List transactions,
    String? callbackUrl,
    String? walletId,
  }) async {
    return await sendMoney(
      test: test,
      provider: "MPESA-B2B",
      currency: currency,
      transactions: transactions,
      callbackUrl: callbackUrl!,
      walletId: walletId!,
    );
  }

  Future<Map<String, dynamic>> intasend({
    required bool test,
    required Currency currency,
    required List transactions,
    String? callbackUrl,
    String? walletId,
  }) async {
    return await sendMoney(
      test: test,
      provider: "INTASEND",
      currency: currency,
      transactions: transactions,
      callbackUrl: callbackUrl!,
      walletId: walletId!,
    );
  }

  Future<Map<String, dynamic>> bank({
    required bool test,
    required Currency currency,
    required List transactions,
    String? callbackUrl,
    String? walletId,
  }) async {
    return await sendMoney(
      test: test,
      provider: "PESALINK",
      currency: currency,
      transactions: transactions,
      callbackUrl: callbackUrl!,
      walletId: walletId!,
    );
  }

  Future<Map<String, dynamic>> airtime({
    required bool test,
    String? callbackUrl,
    String? walletId,
  }) async {
    return await sendMoney(
      test: test,
      provider: "AIRTIME",
      currency: Currency.kes,
      transactions: [],
      callbackUrl: callbackUrl!,
      walletId: walletId!,
    );
  }
}

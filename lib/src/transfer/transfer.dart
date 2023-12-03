import 'package:intasend/intasend.dart';
import 'package:intasend/src/utils.dart';

class Transfer {
  Future<Map<String, dynamic>> send({
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
      endPoint: "send-money/initiate/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

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
}

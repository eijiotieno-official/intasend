import 'dart:convert';

import 'currency.dart';
import 'keys.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';
import 'wallet_type.dart';

class Intasend {
  /// For sandbox go to https://sandbox.intasend.com/account/api-keys/ and for production use https://payment.intasend.com/account/api-keys/
  static String? _publishableKey;
  static String? _privateKey;

  /// Call [Keys] to access [publishableKey] and [privateKey]
  static Keys keys =
      Keys(privateKey: _privateKey!, publishableKey: _publishableKey!);

  /// Collect the [publishableKey] and [privateKey] first before calling other methods
  static Future<void> initialise({
    required String publishableKey,
    required String privateKey,
  }) async {
    _publishableKey = publishableKey;
    _privateKey = privateKey;
  }

  /// Create a wallet supported by Intasend
  static Future createWallet({
    required bool test,
    required WalletType walletType,
    required Currency currency,
    required bool canDisburse,
    required String label,
  }) async {
    String url = "${activeHost(test: test)}/api/v1/wallets/";

    final Map<String, dynamic> requestData = {
      'label': label,
      'wallet_type': enumStringWalletType(walletType: walletType),
      'currency': enumStringCurrency(currency: currency),
      'can_disburse': canDisburse,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'INTASEND_PUBLIC_API_KEY': _publishableKey!,
          'Authorization': 'Bearer $_privateKey',
        },
        body: jsonEncode(requestData),
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['errors'][0]['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

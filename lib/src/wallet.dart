import 'dart:convert';

import 'package:http/http.dart' as http;

import 'currency.dart';
import 'intasend.dart';
import 'utils.dart';
import 'wallet_type.dart';

class Wallet {
  final String id;
  final String label;
  final WalletType walletType;
  final Currency currency;
  final bool canDisburse;
  final double currentBalance;
  final double availableBalance;
  final DateTime updatedAt;

  Wallet({
    required this.label,
    required this.id,
    required this.walletType,
    required this.currency,
    required this.canDisburse,
    required this.currentBalance,
    required this.availableBalance,
    required this.updatedAt,
  });

  Future<Map<String, dynamic>> create({
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

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'INTASEND_PUBLIC_API_KEY': Intasend().keys().publishableKey,
        'Authorization': 'Bearer ${Intasend().keys().privateKey}',
      },
      body: jsonEncode(requestData),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['errors'][0]['detail']);
    }
  }
}

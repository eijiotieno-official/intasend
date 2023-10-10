
import 'package:intasend/src/currency.dart';
import 'package:intasend/src/intasend.dart';
import 'package:intasend/src/utils.dart';

import 'wallet_type.dart';

class Wallet {
  /// Creates a wallet supported by Intasend
  Future<Map<String, dynamic>> create({
    required bool test,
    required WalletType walletType,
    required Currency currency,
    required bool canDisburse,
    required String label,
  }) async {
    final Map<String, dynamic> payload = {
      'label': label,
      'wallet_type': enumStringWalletType(walletType: walletType),
      'currency': enumStringCurrency(currency: currency),
      'can_disburse': canDisburse,
    };
    return await sendPostRequest(
      endPoint: "wallets/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  /// Fund a wallet through M-PESA
  Future<Map<String, dynamic>> fund({
    required bool test,
    required String walletId,
    required String phoneNumber,
    required String email,
    required double amount,
    required String narrative,
    required Currency currency,
    required String name,
  }) async {
    final Map<String, dynamic> payload = {
      'wallet_id': walletId,
      'currency': enumStringCurrency(currency: currency),
      'public_key': Intasend.keys.publishableKey,
      'method': "M-PESA",
      'amount': amount,
      'phone_number': phoneNumber,
      'api_ref': "API Request",
      'name': name,
      'email': email,
      'narrative': narrative,
    };
    return await sendPostRequest(
      endPoint: "payment/mpesa-stk-push/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }

  /// Get wallet details
  Future<Map<String, dynamic>> details({
    required bool test,
    required String walletId,
  }) async {
    return await sendGetRequest(
      endPoint: "wallets/$walletId",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }

  /// Get transactions made with a specific wallet
  Future<Map<String, dynamic>> transactions({
    required bool test,
    required String walletId,
  }) async {
    return await sendGetRequest(
      endPoint: "wallets/$walletId/transactions",
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
      test: test,
    );
  }

  /// Transfer funds from one wallet to another
  Future<Map<String, dynamic>> intraTransfer({
    required bool test,
    required String originId,
    required String destinationId,
    required double amount,
    required String narrative,
  }) async {
    final Map<String, dynamic> payload = {
      'wallet_id': destinationId,
      'amount': amount,
      'narrative': narrative,
    };
    return await sendPostRequest(
      endPoint: "wallets/$originId/intra_transfer/",
      payload: payload,
      test: test,
      publishableKey: Intasend.keys.publishableKey,
      privateKey: Intasend.keys.privateKey,
    );
  }
}

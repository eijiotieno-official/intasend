import 'currency.dart';
import 'keys.dart';

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
  static Future<Map<String, dynamic>> createWallet({
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
      publishableKey: _publishableKey,
      privateKey: _privateKey,
    );
  }

  /// Fund a wallet through M-PESA
  static Future<Map<String, dynamic>> fundWalletWithMpesa({
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
      'public_key': _publishableKey!,
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
      publishableKey: _publishableKey,
      privateKey: _privateKey,
    );
  }

  // static Future<Map<String, dynamic>> checkOut({
  //   required bool test,
  //   required String walletId,
  //   required String phoneNumber,
  //   required String email,
  //   required double amount,
  //   required Currency currency,
  //   required String firstName,
  //   required String lastName,
  //   required String method,
  //   String apiRef = "API Request",
  //   required String comment,
  //   required String callbackUrl,
  //   required String mobileTarrif,
  //   required String cardTarrif,
  // }) async {
  //   final Map<String, dynamic> requestData = {
  //     'wallet_id': walletId,
  //     'currency': enumStringCurrency(currency: currency),
  //     'public_key': _publishableKey!,
  //     'method': method,
  //     'amount': amount,
  //     'phone_number': phoneNumber,
  //     'api_ref': apiRef,
  //     'callback_url': callbackUrl,
  //     'comment': comment,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     'email': email,
  //     'mobile_tarrif': mobileTarrif,
  //     'card_tarrif': cardTarrif,
  //     "version": "3.0.0"
  //   };

  //   return await sendRequest(
  //     endPoint: "checkout/",
  //     requestData: requestData,
  //     test: test,
  //   );
  // }
}

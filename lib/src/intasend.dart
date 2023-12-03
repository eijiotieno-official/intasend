import 'customer/customer.dart';
import 'keys.dart';
import 'transfer/transfer.dart';
import 'wallet/wallet.dart';

class Intasend {
  /// For sandbox go to https://sandbox.intasend.com/account/api-keys/ and for production use https://payment.intasend.com/account/api-keys/
  static String? _publishableKey;
  static String? _privateKey;

  /// Collect the [publishableKey] and [privateKey] first before calling other methods
  static init({required String publishableKey, required String privateKey}) {
    _publishableKey = publishableKey;
    _privateKey = privateKey;
  }

  static Keys get keys =>
      Keys(privateKey: _privateKey!, publishableKey: _publishableKey!);

  static Wallet get wallet => Wallet();

  static Customer get customer => Customer();

  static Transfer get transfer => Transfer();
}

import 'keys.dart';
import 'wallet.dart';

class Intasend {
  static String? _publishableKey;
  static String? _privateKey;

  Keys keys() =>
      Keys(privateKey: _privateKey!, publishableKey: _publishableKey!);

  static init({required String publishableKey, required String privateKey}) {
    _publishableKey = publishableKey;
    _privateKey = privateKey;
  }

  static late Wallet wallet;
}

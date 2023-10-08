import 'currency.dart';
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
}

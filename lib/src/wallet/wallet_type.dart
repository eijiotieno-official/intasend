/// IntaSend accounts have [SETTLEMENT] accounts which act as main accounts. [WORKING] wallets are basically sub-accounts that you can use to isolate your customers'/merchants' funds.
enum WalletType { working, settlement }

WalletType enumWalletType({required String string}) => WalletType.values
    .firstWhere((e) => e.toString().split('.').last == string.toLowerCase());

String enumStringWalletType({required WalletType walletType}) => walletType
    .toString()
    .substring(walletType.toString().indexOf('.') + 1)
    .toUpperCase();

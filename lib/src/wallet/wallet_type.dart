enum WalletType { working, settlement }

WalletType enumWalletType({required String string}) => WalletType.values
    .firstWhere((e) => e.toString().split('.').last == string.toLowerCase());

String enumStringWalletType({required WalletType walletType}) => walletType
    .toString()
    .substring(walletType.toString().indexOf('.') + 1)
    .toUpperCase();

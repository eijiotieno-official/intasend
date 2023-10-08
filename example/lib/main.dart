import 'package:flutter/material.dart';
import 'package:intasend/intasend.dart';

Future<void> main() async {
  runApp(
    const MainApp(),
  );
  await Intasend.initialise(
      publishableKey: "publishableKey", privateKey: "privateKey");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleScreen(),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intasend"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                Intasend.createWallet(
                  test: true,
                  walletType: WalletType.settlement,
                  currency: Currency.kes,
                  canDisburse: true,
                  label: "wallet_label",
                ).then((value) => debugPrint(value.toString()));
              },
              child: const Text("Create Wallet"),
            ),
          ),
        ],
      ),
    );
  }
}

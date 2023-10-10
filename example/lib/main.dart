import 'package:flutter/material.dart';
import 'package:intasend/intasend.dart';

Future<void> main() async {
  runApp(
    const MainApp(),
  );
  Intasend.init(
    publishableKey: "ISPubKey_test_afc2cca5-0490-40a2-b704-7c221086d84a",
    privateKey: "ISSecretKey_test_3fc606d8-ea85-484b-942b-00173d030d87",
  );
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
        title: const Text("Intasend Wallets"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.wallet
                      .create(
                        test: true,
                        walletType: WalletType.working,
                        currency: Currency.kes,
                        canDisburse: true,
                        label: "urfu349023od",
                      )
                      .then((value) => debugPrint(value.toString()));
                },
                child: const Text("Create Wallet"),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.wallet
                      .fund(
                        test: true,
                        walletId: "GR8JNZR",
                        phoneNumber: "254706733999",
                        email: "eijiotieno.official.mail@gmail.com",
                        amount: 10,
                        narrative: "narrative",
                        currency: Currency.kes,
                        name: "eijiotieno",
                      )
                      .then((value) => debugPrint(value.toString()));
                },
                child: const Text("Fund with M-PESA"),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.wallet
                      .details(test: true, walletId: "GR8JNZR")
                      .then((value) => debugPrint(value.toString()));
                },
                child: const Text("Wallet Details"),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.wallet
                      .transactions(test: true, walletId: "GR8JNZR")
                      .then((value) => debugPrint(value.toString()));
                },
                child: const Text("Wallet's Transactions History"),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.wallet
                      .intraTransfer(
                        test: true,
                        originId: "originId",
                        destinationId: "destinationId",
                        amount: 5,
                        narrative: "narrative",
                      )
                      .then((value) => debugPrint(value.toString()));
                },
                child: const Text("Intra-Transfer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

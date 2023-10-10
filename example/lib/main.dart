import 'package:flutter/material.dart';
import 'package:intasend/intasend.dart';

Future<void> main() async {
  runApp(
    const MainApp(),
  );
  await Intasend.initialise(
      publishableKey: "ISPubKey_test_afc2cca5-0490-40a2-b704-7c221086d84a",
      privateKey: "ISSecretKey_test_3fc606d8-ea85-484b-942b-00173d030d87");
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.createWallet(
                    test: true,
                    walletType: WalletType.working,
                    currency: Currency.kes,
                    canDisburse: true,
                    label: "urfu349023od",
                  ).then((value) => debugPrint(value.toString()));
                },
                child: const Text("Create Wallet"),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  Intasend.fundWalletWithMpesa(
                    test: true,
                    walletId: "GR8JNZR",
                    phoneNumber: "254706733999",
                    email: "eijiotieno.official.mail@gmail.com",
                    amount: 10,
                    narrative: "narrative",
                    currency: Currency.kes,
                    name: "eijiotieno",
                  ).then((value) => debugPrint(value.toString()));
                },
                child: const Text("Fund with M-PESA"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

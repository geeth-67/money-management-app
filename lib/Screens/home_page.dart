import 'package:flutter/material.dart';


class BankingApp extends StatefulWidget {
  const BankingApp({super.key});

  @override
  State<BankingApp> createState() => _BankingAppState();
}

class _BankingAppState extends State<BankingApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFf3eefb),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/wallet.png",
                    width: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'Screens/home_page.dart';


void main() {
  runApp(const bankingApp());
}

class bankingApp extends StatelessWidget {
  const bankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const BankingApp(),
    );
  }
}
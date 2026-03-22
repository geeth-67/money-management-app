import 'package:banking_app/screens/add-transaction-demo.dart';
import 'package:banking_app/screens/add_transaction.dart';
import 'package:banking_app/screens/analytics.dart';
import 'package:banking_app/screens/home_screen.dart';
import 'package:banking_app/screens/input_fields.dart';
import 'package:banking_app/screens/success_screen.dart';
import 'package:banking_app/screens/transactions_screen.dart';
import 'package:flutter/material.dart';

import 'configs/size_config.dart';
import 'screens/launch_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => LaunchScreen(),
        '/home' : (context) => HomeScreen(),
        '/transactions' : (context) => Transactions(),
        '/transaction-add' : (context) => AddTransaction(),
        '/transaction-success': (context) => SuccessScreen(),
        '/analytics' : (context) => Analytics(),
        '/input-fields' : (context) => InputFields(),
        '/add-transactions-demo' : (context) => AddTransactionDemo()
      },
      builder: (context, child){
        SizeConfig.init(context);
        return child!;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

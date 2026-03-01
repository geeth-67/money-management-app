import 'package:flutter/material.dart';
import '../Data/Model/transaction_model.dart';


class TransactionWidget extends StatelessWidget {


  const TransactionWidget({super.key, required this.transaction });

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(transaction.iconName),

      title: Text(transaction.title, style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold)),

      subtitle: Text(transaction.date.toString()),

      trailing: Text(
        "${transaction.isExpense ? "-\$" : "+\$"}${transaction.amount.toStringAsFixed(2)}",
        style: TextStyle(
          color: transaction.isExpense ? Colors.red : Colors.green,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
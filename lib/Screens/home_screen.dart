import 'package:banking_app/Data/Model/transaction_model.dart';
import 'package:banking_app/Screens/profile_screen.dart';
import 'package:banking_app/Widgets/transaction_widget.dart';
import 'package:banking_app/configs/size_config.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<TransactionModel> transactions = [
    TransactionModel(iconName: 'icon', title: 'Groceries', date: DateTime(2026, 02, 22), amount: 120.50, isExpense: true),
    TransactionModel(iconName: 'icon', title: 'Salary', date: DateTime(2026, 02, 20), amount: 2500.00, isExpense: false),
    TransactionModel(iconName: 'icon', title: 'Uber', date: DateTime(2026, 02, 19), amount: 35.75, isExpense: true),
    TransactionModel(iconName: 'icon', title: 'Restaurant', date: DateTime(2026, 02, 18), amount: 82.40, isExpense: true),
    TransactionModel(iconName: 'icon', title: 'Online Store', date: DateTime(2026, 02, 17), amount: 150.00, isExpense: true),
    TransactionModel(iconName: 'icon', title: 'Bank Transfer', date: DateTime(2026, 02, 16), amount: 100.00, isExpense: true),
    TransactionModel(iconName: 'icon', title: 'Freelance Project', date: DateTime(2026, 02, 15), amount: 600.00, isExpense: false),
    TransactionModel(iconName: 'icon', title: 'Netflix', date: DateTime(2026, 02, 14), amount: 19.99, isExpense: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        size: 50,
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "March 2024",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,  MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                        );
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),

              Divider(thickness: 1,),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF645ae0),
                      Color(0xffdc758a),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(SizeConfig.blockWidth * 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: SizeConfig.blockWidth * 1.5),

                      const Text(
                        "\$3,550.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: SizeConfig.blockWidth * 11),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.white60,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    "\$2,500",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.pink,
                                child: Icon(
                                  Icons.arrow_upward,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expense",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$950",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.blockWidth * 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF6E2BC6),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.blockWidth * 7),

              Container(
                height: SizeConfig.blockHeight * 42 ,
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFEBEDF0)
                ),

                child: Expanded(
                  child: ListView.separated(
                    itemCount: transactions.length,
                    itemBuilder: (context, index){
                      return TransactionWidget(transaction: transactions[index]);
                    },
                    separatorBuilder: (context , index){
                      return Divider(thickness: 1,);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
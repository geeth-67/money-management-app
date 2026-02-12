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

              SizedBox(height: 10),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save your money",style: TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,color: Color(0xff565761)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("with expense Tracker", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600, color: Color(0xff565761)
                      ),)
                    ],
                  )
                ],
              ),

              SizedBox(height: 35),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save money! The more your money",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("works for you, "
                          "the less you have to work",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("for money.",style: TextStyle(
                          fontSize: 16 ,
                          color: Colors.grey),)
                    ],
                  ),
                ],
              ),

              SizedBox(height: 140),

              ElevatedButton(
                onPressed: () {},

                child: const Text(
                  "Let's Start",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
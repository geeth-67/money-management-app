import 'package:banking_app/Screens/home_screen.dart';
import 'package:banking_app/configs/size_config.dart';
import 'package:flutter/material.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: SizeConfig.blockHeight * 100,
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockHeight * 50,
                width: SizeConfig.blockWidth * 75,
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

              // Container(
              //   child: Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              //   width: 100,
              //     loadingBuilder: (context, child , loadingProgress) {
              //     if (loadingProgress == null) return child;
              //     return Center(child: const CircularProgressIndicator(),);      //loading to open web images
              //     },
              //   ),
              // ),

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

              Spacer(),

              Container(
                margin: EdgeInsets.only(bottom: SizeConfig.blockWidth * 6),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 100),
                    backgroundColor: const Color(0xFFa061e2),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Let's Start",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
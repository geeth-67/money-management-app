import 'package:flutter/material.dart';
import 'Screens/launch_screen.dart';
import 'configs/size_config.dart';


void main() {
  runApp(const moneyManagemenetApp());
}

class moneyManagemenetApp extends StatelessWidget {
  const moneyManagemenetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context ,child) {
        SizeConfig.init(context);
        return child !;
      },
      debugShowCheckedModeBanner: false,

      home: const LaunchScreen(),
    );
  }
}
import 'package:flutter/material.dart';

import '../configs/size_config.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.blockWidth * 100,
        height: SizeConfig.blockHeight * 100,
        color: Colors.white60,
        child: Center(
          child: ElevatedButton(onPressed: null, child: Text("Analysis")),
        ),
      ),
    );
  }
}

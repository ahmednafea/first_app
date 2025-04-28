import 'dart:async';

import 'package:flutter/material.dart';

class DigitalWatchScreen extends StatefulWidget {
  const DigitalWatchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DigitalWatchScreenState();
  }
}

class DigitalWatchScreenState extends State<DigitalWatchScreen> {
  late DateTime currentDate;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    timer = Timer.periodic(Duration(milliseconds: 200), (val) {
      setState(() {
        currentDate = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${currentDate.toString().replaceAll(" ", "\n")}"),
      ),
    );
  }
}

import 'dart:async';

import 'package:first_app/cache_helper.dart';
import 'package:first_app/custome_text_widget.dart';
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
    bool isUpdatable =
        CacheHelper.sharedPreferences.getBool("isUpdatableWatch") ?? true;
    timer = Timer.periodic(Duration(milliseconds: 200), (val) {
      if (isUpdatable) {
        setState(() {
          currentDate = DateTime.now();
        });
      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
                data: "${currentDate.toString().replaceAll(" ", "\n")}"),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                bool isUpdatable =
                    CacheHelper.sharedPreferences.getBool("isUpdatableWatch") ??
                        true;
                CacheHelper.sharedPreferences
                    .setBool("isUpdatableWatch", !isUpdatable);
              },
              child: CustomTextWidget(
                data: "Hello World",
                textColor: Colors.deepOrange,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textDecoration: TextDecoration.lineThrough,
              ),
            )
          ],
        ),
      ),
    );
  }
}

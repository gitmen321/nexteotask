import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteotask/screens/mobile_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MobileScreen(),
    );
  }
}

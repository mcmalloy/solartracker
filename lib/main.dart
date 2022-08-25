import 'package:flutter/material.dart';
import 'package:solartracker/Desktop/Modules/circular_animation_module.dart';
import 'package:solartracker/Desktop/Pages/dashboard.dart';
import 'package:solartracker/Desktop/Pages/login_page.dart';

import 'Web/cv_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CVDashBoard()
    );
  }
}

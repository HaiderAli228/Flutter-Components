import 'package:flutter/material.dart';
import 'package:flutter_components/alert_msg.dart';
import 'package:flutter_components/button.dart';
import 'package:flutter_components/image_crousal.dart';


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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  AlertScreen(),
    );
  }
}

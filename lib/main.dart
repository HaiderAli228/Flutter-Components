import 'package:flutter/material.dart';
import 'package:flutter_components/InfiniteCarousel.dart';
import 'package:flutter_components/practical.dart';
import 'package:flutter_components/s1.dart';


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
      home:  Practical(),
    );
  }
}

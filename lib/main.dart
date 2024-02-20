import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/HomePage.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'basic calculator',
      home: HomePage(),
    );
  }
}

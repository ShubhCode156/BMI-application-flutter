import 'package:bmiflutterapplication/BMIscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIapp());
}

class BMIapp extends StatelessWidget {
  const BMIapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMIScreen(),
    );
  }
}

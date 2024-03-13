import 'package:flutter/material.dart';
import 'package:mini_calcurater/screens/mysScreen.dart';

void main() {
  runApp(const MyScreen());
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myScreen(),
      title: "MiniCalcurater",
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 60, color: Color(0xFF221f1a)),
          displayMedium: TextStyle(fontSize: 48, color: Color(0xFF221f1a)),
          displaySmall: TextStyle(fontSize: 30, color: Color(0xFF4d443b)),
        ),
        cardColor: Color(0xFF6c5e53),
        backgroundColor: Color(0xFFf7f6f4),
        colorSchemeSeed: Color(0xFF4d443b),
      ),
    );
  }
}

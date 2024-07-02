import 'package:flutter/material.dart';
import 'package:flutter_aula13_2/nova.dart';

void main() {
  runApp(const Nova());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}

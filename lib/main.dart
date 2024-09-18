import 'package:flutter/material.dart';

void main() {
  runApp(const AppBlott());
}

class AppBlott extends StatelessWidget {
  const AppBlott({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blott',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Blott APP',
          ),
        ),
      ),
    );
  }
}

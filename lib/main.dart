import 'package:assessment_blott/features/splash/presentation/splash_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

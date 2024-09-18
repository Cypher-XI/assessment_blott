import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routePath = '/homeScreen';
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

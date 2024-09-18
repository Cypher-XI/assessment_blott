import 'package:flutter/material.dart';

class RouteUndefinedScreen extends StatelessWidget {
  const RouteUndefinedScreen({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          errorMessage,
        ),
      ),
    );
  }
}

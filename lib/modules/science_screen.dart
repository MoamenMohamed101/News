import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Science Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

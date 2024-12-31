import 'package:flutter/material.dart';
import 'package:syncshoppinglist/screens/home/home.dart';
import 'package:syncshoppinglist/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: const Home(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
      ),
    );
  }
}
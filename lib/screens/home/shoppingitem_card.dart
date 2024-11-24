import 'package:flutter/material.dart';

class ShoppingitemCard extends StatelessWidget {
  const ShoppingitemCard(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Row(
          children: [
            Text(name),
          ],
        ),
      ),
    );
  }
}
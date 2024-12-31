import 'package:flutter/material.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';
import 'package:syncshoppinglist/theme.dart';

class ShoppingitemCard extends StatelessWidget {
  const ShoppingitemCard(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Row(
          children: [
            StyledText(name),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.shopping_cart, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
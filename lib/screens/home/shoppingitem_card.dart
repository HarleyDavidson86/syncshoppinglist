import 'package:flutter/material.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';
import 'package:syncshoppinglist/theme.dart';

class ShoppingitemCard extends StatelessWidget {
  const ShoppingitemCard(this.name, this.deleteItem, this.editItem, {super.key});

  final String name;
  final Function(String) deleteItem;
  final Function(String) editItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){editItem(name);},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            children: [
              StyledText(name),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: (){deleteItem(name);}, 
                icon: Icon(Icons.shopping_cart, color: AppColors.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
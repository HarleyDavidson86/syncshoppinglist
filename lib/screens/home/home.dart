import 'package:flutter/material.dart';
import 'package:syncshoppinglist/screens/home/shoppingitem_card.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var items = ['Item 1','Item 2','Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Einkaufsliste"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const StyledText('+'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return ShoppingitemCard(items[index]);
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

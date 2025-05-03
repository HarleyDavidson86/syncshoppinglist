import 'package:flutter/material.dart';
import 'package:syncshoppinglist/screens/home/shoppingitem_card.dart';
import 'package:syncshoppinglist/services/item_service.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ShoppingitemService service = ShoppingitemService();

  void addItemToList() {
    setState(() {
      service.addItem("TestItem ${service.getItemCount() + 1}");
    });
  }

  void removeItemFromList(String name) {
    setState(() {
      service.deleteItem(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Einkaufsliste"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItemToList,
        child: const StyledText('+'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return ShoppingitemCard(
                      service.getItemAtIndex(index), removeItemFromList);
                },
                itemCount: service.getItemCount(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

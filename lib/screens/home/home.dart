import 'package:flutter/material.dart';
import 'package:syncshoppinglist/screens/home/shoppingitem_card.dart';
import 'package:syncshoppinglist/services/item_service.dart';
import 'package:syncshoppinglist/shared/input_dialog.dart';
import 'package:syncshoppinglist/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ShoppingitemService service = ShoppingitemService();

  void addItemToList() async {
    var result = await InputDialog.show(context: context);
    if (result != null) {
      setState(() {
        service.addItem(result);
      });
    }
  }

  void removeItemFromList(String name) {
    setState(() {
      service.deleteItem(name);
    });
  }

  void editItem(String name) {
    InputDialog.show(
      context: context,
      title: "Edit Item",
      initialValue: name
    ).then((newName) {
      if (newName != null && newName.isNotEmpty) {
        setState(() {
          service.updateItem(name, newName);
        });
      }
    });
    setState(() {
      service.updateItem(name, name);
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
                      service.getItemAtIndex(index), removeItemFromList, editItem);
                },
                itemCount: service.itemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

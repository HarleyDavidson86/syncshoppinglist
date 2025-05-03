class ShoppingitemService {
  final List<String> _items = <String>[];

  void addItem(String newItem) {
    if (!_items.contains(newItem)) {
      _items.add(newItem);
    }
  }

  String getItemAtIndex(int index) {
    return _items.elementAt(index);
  }

  void updateItem(String oldName, String newName) {
    var indexOfItem = _items.indexOf(oldName);
    if (indexOfItem != -1) {
      _items.removeAt(indexOfItem);
      _items.insert(indexOfItem, newName);
    }
  }

  void deleteItem(String name) {
    _items.remove(name);
  }

  int getItemCount() {
    return _items.length;
  }
}

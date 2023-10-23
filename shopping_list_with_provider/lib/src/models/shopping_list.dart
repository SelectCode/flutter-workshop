import 'package:flutter/foundation.dart';

class ShoppingList extends ChangeNotifier {
  final List<ShoppingListItem> items;

  static int _nextId = 0;

  ShoppingList() : items = [];

  void addItem({
    required String name,
    required int quantity,
  }) {
    items.add(
      ShoppingListItem(
        id: _nextId++,
        name: name,
        quantity: quantity,
        isBought: false,
      ),
    );
    notifyListeners();
  }

  void updateItem(
    ShoppingListItem item, {
    bool? isBought,
  }) {
    item.isBought = isBought ?? item.isBought;
    notifyListeners();
  }
}

class ShoppingListItem {
  final int id;
  final String name;
  final int quantity;
  bool isBought;

  ShoppingListItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.isBought,
  });
}

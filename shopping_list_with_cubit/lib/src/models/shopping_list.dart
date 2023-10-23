class ShoppingList {
  final List<ShoppingListItem> items;

  const ShoppingList({
    this.items = const [],
  });

  ShoppingList copyWith({
    List<ShoppingListItem>? items,
  }) {
    return ShoppingList(
      items: items ?? this.items,
    );
  }
}

class ShoppingListItem {
  final int id;
  final String name;
  final int quantity;
  final bool isBought;

  const ShoppingListItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.isBought,
  });

  factory ShoppingListItem.unbought({
    required int id,
    required String name,
    required int quantity,
  }) {
    return ShoppingListItem(
      id: id,
      name: name,
      quantity: quantity,
      isBought: false,
    );
  }

  ShoppingListItem copyWith({
    bool? isBought,
  }) {
    return ShoppingListItem(
      id: id,
      name: name,
      quantity: quantity,
      isBought: isBought ?? this.isBought,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_list/src/models/shopping_list.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({
    required this.shoppingList,
    super.key,
  });

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingList.items.length,
      itemBuilder: (context, index) {
        final item = shoppingList.items[index];
        return _ShoppingListItemTile(
          key: ValueKey(item.id),
          item: item,
        );
      },
    );
  }
}

class _ShoppingListItemTile extends StatefulWidget {
  const _ShoppingListItemTile({
    required this.item,
    super.key,
  });

  final ShoppingListItem item;

  @override
  State<_ShoppingListItemTile> createState() => _ShoppingListItemTileState();
}

class _ShoppingListItemTileState extends State<_ShoppingListItemTile> {
  ShoppingListItem get item => widget.item;

  void _toggleBought() {
    setState(() {
      item.isBought = !item.isBought;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _toggleBought,
      leading: Text('${item.quantity}x'),
      title: Text(item.name),
      trailing: Checkbox(
        value: item.isBought,
        onChanged: (_) {
          _toggleBought();
        },
      ),
    );
  }
}

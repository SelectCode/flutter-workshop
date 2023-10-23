import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_with_provider/src/models/shopping_list.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shoppingList = Provider.of<ShoppingList>(context);
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

class _ShoppingListItemTile extends StatelessWidget {
  const _ShoppingListItemTile({
    required this.item,
    super.key,
  });

  final ShoppingListItem item;

  void _toggleBought(BuildContext context) {
    Provider.of<ShoppingList>(context, listen: false)
        .updateItem(item, isBought: !item.isBought);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _toggleBought(context),
      leading: Text('${item.quantity}x'),
      title: Text(item.name),
      trailing: Checkbox(
        value: item.isBought,
        onChanged: (_) {
          _toggleBought(context);
        },
      ),
    );
  }
}

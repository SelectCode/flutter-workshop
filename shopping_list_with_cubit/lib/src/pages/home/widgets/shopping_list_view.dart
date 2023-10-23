import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_with_cubit/src/models/shopping_list.dart';
import 'package:shopping_list_with_cubit/src/shopping_list_cubit.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        final shoppingList = state.shoppingList;
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
    context
        .read<ShoppingListCubit>()
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

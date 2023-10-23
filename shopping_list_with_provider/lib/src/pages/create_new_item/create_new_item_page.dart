import 'package:flutter/material.dart';
import 'package:shopping_list_with_provider/src/pages/create_new_item/widgets/create_new_item_form.dart';

class CreateNewShoppingListItemPage extends StatelessWidget {
  const CreateNewShoppingListItemPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Create new item'),
      ),
      body: const CreateNewItemForm(),
    );
  }
}

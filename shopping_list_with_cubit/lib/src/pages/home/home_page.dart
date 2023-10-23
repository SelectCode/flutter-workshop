import 'package:flutter/material.dart';
import 'package:shopping_list_with_cubit/src/models/shopping_list.dart';
import 'package:shopping_list_with_cubit/src/pages/create_new_item/create_new_item_page.dart';
import 'package:shopping_list_with_cubit/src/pages/home/widgets/shopping_list_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const ShoppingListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push<(int, String)>(
            MaterialPageRoute(
              builder: (context) {
                return const CreateNewShoppingListItemPage();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

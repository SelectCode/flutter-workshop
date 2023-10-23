import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_with_provider/src/models/shopping_list.dart';
import 'package:shopping_list_with_provider/src/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => ShoppingList()
        ..addItem(
          name: 'Apple',
          quantity: 10,
        ),
      child: MaterialApp(
        title: 'Shopping list',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(
              0xff38bdf8,
            ),
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Your shopping list'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_with_cubit/src/pages/home/home_page.dart';
import 'package:shopping_list_with_cubit/src/shopping_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingListCubit(),
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

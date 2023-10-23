part of 'shopping_list_cubit.dart';

abstract class ShoppingListState extends Equatable {
  const ShoppingListState();

  ShoppingList get shoppingList;
}

class ShoppingListInitial extends ShoppingListState {
  @override
  List<Object> get props => [shoppingList];

  @override
  ShoppingList get shoppingList => const ShoppingList();
}

class ShoppingListUpdated extends ShoppingListState {
  const ShoppingListUpdated({
    required this.shoppingList,
  });

  @override
  final ShoppingList shoppingList;

  @override
  List<Object> get props => [shoppingList];
}

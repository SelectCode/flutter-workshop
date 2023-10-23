part of 'shopping_list_cubit.dart';

abstract class ShoppingListState extends Equatable {
  const ShoppingListState();

  ShoppingList get shoppingList;
}

class ShoppingListInitial extends ShoppingListState {
  @override
  final ShoppingList shoppingList;

  ShoppingListInitial(
    List<ShoppingListItem> items,
  ) : shoppingList = ShoppingList(items: items);

  @override
  List<Object> get props => [shoppingList];
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

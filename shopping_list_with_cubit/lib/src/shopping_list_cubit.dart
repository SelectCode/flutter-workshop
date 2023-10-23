import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_list_with_cubit/src/models/shopping_list.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  static const _initialItems = [
    ShoppingListItem(
      id: 0,
      name: 'Apple',
      quantity: 10,
      isBought: false,
    ),
  ];

  int _nextId = _initialItems.length;

  ShoppingListCubit() : super(ShoppingListInitial(_initialItems));

  void updateItem(ShoppingListItem item, {required bool isBought}) {
    final updatedItems = state.shoppingList.items.map((i) {
      if (i.id == item.id) {
        return item.copyWith(isBought: isBought);
      } else {
        return i;
      }
    }).toList();
    emit(ShoppingListUpdated(
        shoppingList: state.shoppingList.copyWith(
      items: updatedItems,
    )));
  }

  void addItem({
    required String name,
    required int quantity,
  }) {
    final updatedItems = [
      ...state.shoppingList.items,
      ShoppingListItem.unbought(
        id: _nextId++,
        name: name,
        quantity: quantity,
      ),
    ];
    emit(ShoppingListUpdated(
        shoppingList: state.shoppingList.copyWith(
      items: updatedItems,
    )));
  }
}

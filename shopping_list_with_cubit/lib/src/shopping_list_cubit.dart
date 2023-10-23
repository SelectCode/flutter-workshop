import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_list_with_cubit/src/models/shopping_list.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  int _nextId = 0;

  ShoppingListCubit() : super(ShoppingListInitial());

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

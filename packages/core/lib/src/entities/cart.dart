import 'package:core/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    @Default([]) List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, Object?> json) => _$CartFromJson(json);

  Cart addItem(CartItem newItem) {
    var index = items.indexWhere((item) =>
        item.menuItem.id == newItem.menuItem.id &&
        item.selectedOptions == newItem.selectedOptions);

    if (index != -1) {
      var existingItem = items[index];
      var updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + newItem.quantity);
      var updatedItems = List<CartItem>.from(items);
      updatedItems[index] = updatedItem;
      return copyWith(items: updatedItems);
    } else {
      return copyWith(items: [...items, newItem]);
    }
  }

  // Removes an item from the cart or decreases its quantity.
  Cart removeItem(CartItem itemToRemove) {
    var index = items.indexWhere((item) =>
        item.menuItem.id == itemToRemove.menuItem.id &&
        item.selectedOptions == itemToRemove.selectedOptions);

    if (index != -1) {
      var existingItem = items[index];
      if (existingItem.quantity > 1) {
        var updatedItem =
            existingItem.copyWith(quantity: existingItem.quantity - 1);
        var updatedItems = List<CartItem>.from(items);
        updatedItems[index] = updatedItem;
        return copyWith(items: updatedItems);
      } else {
        var updatedItems = List<CartItem>.from(items)..removeAt(index);
        return copyWith(items: updatedItems);
      }
    } else {
      return this;
    }
  }

  Cart clear() => copyWith(items: []);

  double get totalPrice => items.fold(
        0,
        (total, current) => total + (current.menuItem.price * current.quantity),
      );
}

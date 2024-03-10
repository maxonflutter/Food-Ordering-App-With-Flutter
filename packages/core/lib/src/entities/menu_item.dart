import 'package:core/src/entities/menu_item_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String sectionId,
    required String restaurantId,
    required String name,
    String? description,
    String? imageUrl,
    List<MenuItemOption>? options,
    required double price,
    required bool available,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, Object?> json) =>
      _$MenuItemFromJson(json);
}

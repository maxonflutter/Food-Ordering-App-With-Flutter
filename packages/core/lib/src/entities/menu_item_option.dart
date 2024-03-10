import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_option.freezed.dart';
part 'menu_item_option.g.dart';

@freezed
class MenuItemOption with _$MenuItemOption {
  const factory MenuItemOption({
    required String id,
    required String menuItemId,
    required String name,
    required double additionalCost,
    String? description,
  }) = _MenuItemOption;

  factory MenuItemOption.fromJson(Map<String, Object?> json) =>
      _$MenuItemOptionFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu_item.dart';

part 'menu_section.freezed.dart';
part 'menu_section.g.dart';

@freezed
class MenuSection with _$MenuSection {
  const factory MenuSection({
    required String id,
    required String restaurantId,
    required String name,
    String? description,
    String? imageUrl,
    required List<MenuItem> items,
  }) = _MenuSection;

  factory MenuSection.fromJson(Map<String, Object?> json) =>
      _$MenuSectionFromJson(json);
}

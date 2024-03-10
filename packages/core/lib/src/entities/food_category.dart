import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_category.freezed.dart';
part 'food_category.g.dart';

@freezed
class FoodCategory with _$FoodCategory {
  const factory FoodCategory({
    required String id,
    required String name,
    required String imageUrl,
  }) = _FoodCategory;

  factory FoodCategory.fromJson(Map<String, Object?> json) =>
      _$FoodCategoryFromJson(json);

  factory FoodCategory.fromJsonWithId(Map<String, dynamic> json, {String? id}) {
    if (id == null) {
      return FoodCategory.fromJson(json);
    }
    return FoodCategory.fromJson(json).copyWith(id: id);
  }
}

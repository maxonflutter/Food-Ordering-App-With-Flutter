// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemOptionImpl _$$MenuItemOptionImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemOptionImpl(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String,
      name: json['name'] as String,
      additionalCost: (json['additionalCost'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MenuItemOptionImplToJson(
        _$MenuItemOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menuItemId': instance.menuItemId,
      'name': instance.name,
      'additionalCost': instance.additionalCost,
      'description': instance.description,
    };

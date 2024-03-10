// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      menuItem: MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
      selectedOptions: json['selectedOptions'] == null
          ? null
          : MenuItemOption.fromJson(
              json['selectedOptions'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 1,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'menuItem': instance.menuItem,
      'selectedOptions': instance.selectedOptions,
      'quantity': instance.quantity,
    };

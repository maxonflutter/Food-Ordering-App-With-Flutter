// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      restaurantId: json['restaurantId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      requiredAmount: (json['requiredAmount'] as num).toDouble(),
      deliveryAddress:
          Address.fromJson(json['deliveryAddress'] as Map<String, dynamic>),
      specialInstructions: json['specialInstructions'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'restaurantId': instance.restaurantId,
      'items': instance.items,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'totalPrice': instance.totalPrice,
      'deliveryFee': instance.deliveryFee,
      'taxAmount': instance.taxAmount,
      'discountAmount': instance.discountAmount,
      'requiredAmount': instance.requiredAmount,
      'deliveryAddress': instance.deliveryAddress,
      'specialInstructions': instance.specialInstructions,
      'createdAt': instance.createdAt.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.processing: 'processing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.waitingForPaymentConfirmation: 'waitingForPaymentConfirmation',
  OrderStatus.paymentFailed: 'paymentFailed',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.card: 'card',
};

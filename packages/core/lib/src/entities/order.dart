import 'package:core/entities.dart';
import 'package:core/src/enums/order_status.dart';
import 'package:core/src/enums/payment_method.dart';
import 'package:core/src/value_objects/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String restaurantId,
    required List<CartItem> items,
    required OrderStatus orderStatus,
    required PaymentMethod paymentMethod,
    required double totalPrice,
    required double deliveryFee,
    required double taxAmount,
    required double discountAmount,
    required double requiredAmount,
    required Address deliveryAddress,
    String? specialInstructions,
    required DateTime createdAt,
    DateTime? deliveredAt,
    DateTime? cancelledAt,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

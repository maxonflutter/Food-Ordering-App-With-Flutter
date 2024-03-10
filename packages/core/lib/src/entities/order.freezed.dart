// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  double get requiredAmount => throw _privateConstructorUsedError;
  Address get deliveryAddress => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String restaurantId,
      List<CartItem> items,
      OrderStatus orderStatus,
      PaymentMethod paymentMethod,
      double totalPrice,
      double deliveryFee,
      double taxAmount,
      double discountAmount,
      double requiredAmount,
      Address deliveryAddress,
      String? specialInstructions,
      DateTime createdAt,
      DateTime? deliveredAt,
      DateTime? cancelledAt});

  $AddressCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? restaurantId = null,
    Object? items = null,
    Object? orderStatus = null,
    Object? paymentMethod = null,
    Object? totalPrice = null,
    Object? deliveryFee = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? requiredAmount = null,
    Object? deliveryAddress = null,
    Object? specialInstructions = freezed,
    Object? createdAt = null,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      requiredAmount: null == requiredAmount
          ? _value.requiredAmount
          : requiredAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get deliveryAddress {
    return $AddressCopyWith<$Res>(_value.deliveryAddress, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String restaurantId,
      List<CartItem> items,
      OrderStatus orderStatus,
      PaymentMethod paymentMethod,
      double totalPrice,
      double deliveryFee,
      double taxAmount,
      double discountAmount,
      double requiredAmount,
      Address deliveryAddress,
      String? specialInstructions,
      DateTime createdAt,
      DateTime? deliveredAt,
      DateTime? cancelledAt});

  @override
  $AddressCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? restaurantId = null,
    Object? items = null,
    Object? orderStatus = null,
    Object? paymentMethod = null,
    Object? totalPrice = null,
    Object? deliveryFee = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? requiredAmount = null,
    Object? deliveryAddress = null,
    Object? specialInstructions = freezed,
    Object? createdAt = null,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      requiredAmount: null == requiredAmount
          ? _value.requiredAmount
          : requiredAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.userId,
      required this.restaurantId,
      required final List<CartItem> items,
      required this.orderStatus,
      required this.paymentMethod,
      required this.totalPrice,
      required this.deliveryFee,
      required this.taxAmount,
      required this.discountAmount,
      required this.requiredAmount,
      required this.deliveryAddress,
      this.specialInstructions,
      required this.createdAt,
      this.deliveredAt,
      this.cancelledAt})
      : _items = items;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String restaurantId;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final OrderStatus orderStatus;
  @override
  final PaymentMethod paymentMethod;
  @override
  final double totalPrice;
  @override
  final double deliveryFee;
  @override
  final double taxAmount;
  @override
  final double discountAmount;
  @override
  final double requiredAmount;
  @override
  final Address deliveryAddress;
  @override
  final String? specialInstructions;
  @override
  final DateTime createdAt;
  @override
  final DateTime? deliveredAt;
  @override
  final DateTime? cancelledAt;

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, restaurantId: $restaurantId, items: $items, orderStatus: $orderStatus, paymentMethod: $paymentMethod, totalPrice: $totalPrice, deliveryFee: $deliveryFee, taxAmount: $taxAmount, discountAmount: $discountAmount, requiredAmount: $requiredAmount, deliveryAddress: $deliveryAddress, specialInstructions: $specialInstructions, createdAt: $createdAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.requiredAmount, requiredAmount) ||
                other.requiredAmount == requiredAmount) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      restaurantId,
      const DeepCollectionEquality().hash(_items),
      orderStatus,
      paymentMethod,
      totalPrice,
      deliveryFee,
      taxAmount,
      discountAmount,
      requiredAmount,
      deliveryAddress,
      specialInstructions,
      createdAt,
      deliveredAt,
      cancelledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String userId,
      required final String restaurantId,
      required final List<CartItem> items,
      required final OrderStatus orderStatus,
      required final PaymentMethod paymentMethod,
      required final double totalPrice,
      required final double deliveryFee,
      required final double taxAmount,
      required final double discountAmount,
      required final double requiredAmount,
      required final Address deliveryAddress,
      final String? specialInstructions,
      required final DateTime createdAt,
      final DateTime? deliveredAt,
      final DateTime? cancelledAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get restaurantId;
  @override
  List<CartItem> get items;
  @override
  OrderStatus get orderStatus;
  @override
  PaymentMethod get paymentMethod;
  @override
  double get totalPrice;
  @override
  double get deliveryFee;
  @override
  double get taxAmount;
  @override
  double get discountAmount;
  @override
  double get requiredAmount;
  @override
  Address get deliveryAddress;
  @override
  String? get specialInstructions;
  @override
  DateTime get createdAt;
  @override
  DateTime? get deliveredAt;
  @override
  DateTime? get cancelledAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

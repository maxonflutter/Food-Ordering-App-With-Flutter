// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      username: _$JsonConverterFromJson<String, Username>(
          json['username'], const UsernameConverter().fromJson),
      email: _$JsonConverterFromJson<String, Email>(
          json['email'], const EmailConverter().fromJson),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      profilePictureUrl: json['profilePictureUrl'] as String?,
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      defaultPaymentMethod: json['defaultPaymentMethod'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': _$JsonConverterToJson<String, Username>(
          instance.username, const UsernameConverter().toJson),
      'email': _$JsonConverterToJson<String, Email>(
          instance.email, const EmailConverter().toJson),
      'address': instance.address,
      'profilePictureUrl': instance.profilePictureUrl,
      'paymentMethods': instance.paymentMethods,
      'defaultPaymentMethod': instance.defaultPaymentMethod,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

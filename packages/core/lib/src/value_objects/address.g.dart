// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      country: json['country'] as String,
      city: json['city'] as String,
      streetAddress: json['streetAddress'] as String,
      streetNumber: json['streetNumber'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'streetAddress': instance.streetAddress,
      'streetNumber': instance.streetNumber,
      'postalCode': instance.postalCode,
    };

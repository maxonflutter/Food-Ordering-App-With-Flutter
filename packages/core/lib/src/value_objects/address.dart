import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

// dart pub run build_runner build --delete-conflicting-outputs

@freezed
class Address with _$Address {
  const factory Address({
    required String country,
    required String city,
    required String streetAddress,
    required String streetNumber,
    required String postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);

  static const empty = Address(
    country: '',
    city: '',
    streetAddress: '',
    streetNumber: '',
    postalCode: '',
  );

  static const addresses = [
    {
      "country": "USA",
      "city": "New York",
      "streetAddress": "5th Avenue",
      "streetNumber": "123",
      "postalCode": "10001",
    },
    {
      "country": "USA",
      "city": "New York",
      "streetAddress": "5th Avenue",
      "streetNumber": "456",
      "postalCode": "10001",
    },
    {
      "country": "USA",
      "city": "New York",
      "streetAddress": "5th Avenue",
      "streetNumber": "789",
      "postalCode": "10001",
    },
    {
      "country": "USA",
      "city": "New York",
      "streetAddress": "5th Avenue",
      "streetNumber": "101112",
      "postalCode": "10001",
    },
    {
      "country": "USA",
      "city": "New York",
      "streetAddress": "5th Avenue",
      "streetNumber": "131415",
      "postalCode": "10001",
    },
  ];
}

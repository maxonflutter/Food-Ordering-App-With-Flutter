import 'package:core/src/converters/email_converter.dart';
import 'package:core/src/converters/username_converter.dart';
import 'package:core/src/value_objects/address.dart';
import 'package:core/src/value_objects/email.dart';
import 'package:core/src/value_objects/username.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    @UsernameConverter() Username? username,
    @EmailConverter() Email? email,
    Address? address,
    String? profilePictureUrl,
    @Default([]) List<String> paymentMethods,
    String? defaultPaymentMethod,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

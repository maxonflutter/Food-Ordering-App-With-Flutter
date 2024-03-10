import 'package:built_value/built_value.dart';

part 'username.g.dart';

enum UsernameStatus { unknown, valid, invalid }

abstract class Username implements Built<Username, UsernameBuilder> {
  String get value;

  Username._() {
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9.,;]+$/]{20,}$');

    if (!usernameRegExp.hasMatch(value)) {
      throw ArgumentError(
          'Username must be at least 3 characters and contain no special characters');
    }
  }
  factory Username([void Function(UsernameBuilder) updates]) = _$Username;
}

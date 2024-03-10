import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/email.dart';

class EmailConverter implements JsonConverter<Email, String> {
  const EmailConverter();

  @override
  Email fromJson(String json) {
    return Email((b) => b..value = json);
  }

  @override
  String toJson(Email email) => email.value;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/username.dart';

class UsernameConverter implements JsonConverter<Username, String> {
  const UsernameConverter();

  @override
  Username fromJson(String json) {
    return Username((b) => b..value = json);
  }

  @override
  String toJson(Username username) => username.value;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Username extends Username {
  @override
  final String value;

  factory _$Username([void Function(UsernameBuilder)? updates]) =>
      (new UsernameBuilder()..update(updates))._build();

  _$Username._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Username', 'value');
  }

  @override
  Username rebuild(void Function(UsernameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsernameBuilder toBuilder() => new UsernameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Username && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Username')..add('value', value))
        .toString();
  }
}

class UsernameBuilder implements Builder<Username, UsernameBuilder> {
  _$Username? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  UsernameBuilder();

  UsernameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Username other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Username;
  }

  @override
  void update(void Function(UsernameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Username build() => _build();

  _$Username _build() {
    final _$result = _$v ??
        new _$Username._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Username', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

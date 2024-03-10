// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuItemOption _$MenuItemOptionFromJson(Map<String, dynamic> json) {
  return _MenuItemOption.fromJson(json);
}

/// @nodoc
mixin _$MenuItemOption {
  String get id => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get additionalCost => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemOptionCopyWith<MenuItemOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemOptionCopyWith<$Res> {
  factory $MenuItemOptionCopyWith(
          MenuItemOption value, $Res Function(MenuItemOption) then) =
      _$MenuItemOptionCopyWithImpl<$Res, MenuItemOption>;
  @useResult
  $Res call(
      {String id,
      String menuItemId,
      String name,
      double additionalCost,
      String? description});
}

/// @nodoc
class _$MenuItemOptionCopyWithImpl<$Res, $Val extends MenuItemOption>
    implements $MenuItemOptionCopyWith<$Res> {
  _$MenuItemOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? name = null,
    Object? additionalCost = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      additionalCost: null == additionalCost
          ? _value.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemOptionImplCopyWith<$Res>
    implements $MenuItemOptionCopyWith<$Res> {
  factory _$$MenuItemOptionImplCopyWith(_$MenuItemOptionImpl value,
          $Res Function(_$MenuItemOptionImpl) then) =
      __$$MenuItemOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String menuItemId,
      String name,
      double additionalCost,
      String? description});
}

/// @nodoc
class __$$MenuItemOptionImplCopyWithImpl<$Res>
    extends _$MenuItemOptionCopyWithImpl<$Res, _$MenuItemOptionImpl>
    implements _$$MenuItemOptionImplCopyWith<$Res> {
  __$$MenuItemOptionImplCopyWithImpl(
      _$MenuItemOptionImpl _value, $Res Function(_$MenuItemOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? name = null,
    Object? additionalCost = null,
    Object? description = freezed,
  }) {
    return _then(_$MenuItemOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      additionalCost: null == additionalCost
          ? _value.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemOptionImpl implements _MenuItemOption {
  const _$MenuItemOptionImpl(
      {required this.id,
      required this.menuItemId,
      required this.name,
      required this.additionalCost,
      this.description});

  factory _$MenuItemOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String menuItemId;
  @override
  final String name;
  @override
  final double additionalCost;
  @override
  final String? description;

  @override
  String toString() {
    return 'MenuItemOption(id: $id, menuItemId: $menuItemId, name: $name, additionalCost: $additionalCost, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, menuItemId, name, additionalCost, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemOptionImplCopyWith<_$MenuItemOptionImpl> get copyWith =>
      __$$MenuItemOptionImplCopyWithImpl<_$MenuItemOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemOptionImplToJson(
      this,
    );
  }
}

abstract class _MenuItemOption implements MenuItemOption {
  const factory _MenuItemOption(
      {required final String id,
      required final String menuItemId,
      required final String name,
      required final double additionalCost,
      final String? description}) = _$MenuItemOptionImpl;

  factory _MenuItemOption.fromJson(Map<String, dynamic> json) =
      _$MenuItemOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get menuItemId;
  @override
  String get name;
  @override
  double get additionalCost;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$MenuItemOptionImplCopyWith<_$MenuItemOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

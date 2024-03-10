// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuSection _$MenuSectionFromJson(Map<String, dynamic> json) {
  return _MenuSection.fromJson(json);
}

/// @nodoc
mixin _$MenuSection {
  String get id => throw _privateConstructorUsedError;
  String get restaurantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<MenuItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuSectionCopyWith<MenuSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuSectionCopyWith<$Res> {
  factory $MenuSectionCopyWith(
          MenuSection value, $Res Function(MenuSection) then) =
      _$MenuSectionCopyWithImpl<$Res, MenuSection>;
  @useResult
  $Res call(
      {String id,
      String restaurantId,
      String name,
      String? description,
      String? imageUrl,
      List<MenuItem> items});
}

/// @nodoc
class _$MenuSectionCopyWithImpl<$Res, $Val extends MenuSection>
    implements $MenuSectionCopyWith<$Res> {
  _$MenuSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuSectionImplCopyWith<$Res>
    implements $MenuSectionCopyWith<$Res> {
  factory _$$MenuSectionImplCopyWith(
          _$MenuSectionImpl value, $Res Function(_$MenuSectionImpl) then) =
      __$$MenuSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String restaurantId,
      String name,
      String? description,
      String? imageUrl,
      List<MenuItem> items});
}

/// @nodoc
class __$$MenuSectionImplCopyWithImpl<$Res>
    extends _$MenuSectionCopyWithImpl<$Res, _$MenuSectionImpl>
    implements _$$MenuSectionImplCopyWith<$Res> {
  __$$MenuSectionImplCopyWithImpl(
      _$MenuSectionImpl _value, $Res Function(_$MenuSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? items = null,
  }) {
    return _then(_$MenuSectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuSectionImpl implements _MenuSection {
  const _$MenuSectionImpl(
      {required this.id,
      required this.restaurantId,
      required this.name,
      this.description,
      this.imageUrl,
      required final List<MenuItem> items})
      : _items = items;

  factory _$MenuSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuSectionImplFromJson(json);

  @override
  final String id;
  @override
  final String restaurantId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  final List<MenuItem> _items;
  @override
  List<MenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MenuSection(id: $id, restaurantId: $restaurantId, name: $name, description: $description, imageUrl: $imageUrl, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, restaurantId, name,
      description, imageUrl, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuSectionImplCopyWith<_$MenuSectionImpl> get copyWith =>
      __$$MenuSectionImplCopyWithImpl<_$MenuSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuSectionImplToJson(
      this,
    );
  }
}

abstract class _MenuSection implements MenuSection {
  const factory _MenuSection(
      {required final String id,
      required final String restaurantId,
      required final String name,
      final String? description,
      final String? imageUrl,
      required final List<MenuItem> items}) = _$MenuSectionImpl;

  factory _MenuSection.fromJson(Map<String, dynamic> json) =
      _$MenuSectionImpl.fromJson;

  @override
  String get id;
  @override
  String get restaurantId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  List<MenuItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$MenuSectionImplCopyWith<_$MenuSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

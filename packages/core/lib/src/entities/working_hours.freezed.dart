// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkingHours _$WorkingHoursFromJson(Map<String, dynamic> json) {
  return _WorkingHours.fromJson(json);
}

/// @nodoc
mixin _$WorkingHours {
  String get id => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  String get dayOfWeek => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkingHoursCopyWith<WorkingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingHoursCopyWith<$Res> {
  factory $WorkingHoursCopyWith(
          WorkingHours value, $Res Function(WorkingHours) then) =
      _$WorkingHoursCopyWithImpl<$Res, WorkingHours>;
  @useResult
  $Res call(
      {String id,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      String dayOfWeek});
}

/// @nodoc
class _$WorkingHoursCopyWithImpl<$Res, $Val extends WorkingHours>
    implements $WorkingHoursCopyWith<$Res> {
  _$WorkingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? dayOfWeek = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkingHoursImplCopyWith<$Res>
    implements $WorkingHoursCopyWith<$Res> {
  factory _$$WorkingHoursImplCopyWith(
          _$WorkingHoursImpl value, $Res Function(_$WorkingHoursImpl) then) =
      __$$WorkingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      String dayOfWeek});
}

/// @nodoc
class __$$WorkingHoursImplCopyWithImpl<$Res>
    extends _$WorkingHoursCopyWithImpl<$Res, _$WorkingHoursImpl>
    implements _$$WorkingHoursImplCopyWith<$Res> {
  __$$WorkingHoursImplCopyWithImpl(
      _$WorkingHoursImpl _value, $Res Function(_$WorkingHoursImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? dayOfWeek = null,
  }) {
    return _then(_$WorkingHoursImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingHoursImpl implements _WorkingHours {
  const _$WorkingHoursImpl(
      {required this.id,
      @TimeOfDayConverter() required this.startTime,
      @TimeOfDayConverter() required this.endTime,
      required this.dayOfWeek});

  factory _$WorkingHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingHoursImplFromJson(json);

  @override
  final String id;
  @override
  @TimeOfDayConverter()
  final TimeOfDay startTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay endTime;
  @override
  final String dayOfWeek;

  @override
  String toString() {
    return 'WorkingHours(id: $id, startTime: $startTime, endTime: $endTime, dayOfWeek: $dayOfWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingHoursImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startTime, endTime, dayOfWeek);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      __$$WorkingHoursImplCopyWithImpl<_$WorkingHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingHoursImplToJson(
      this,
    );
  }
}

abstract class _WorkingHours implements WorkingHours {
  const factory _WorkingHours(
      {required final String id,
      @TimeOfDayConverter() required final TimeOfDay startTime,
      @TimeOfDayConverter() required final TimeOfDay endTime,
      required final String dayOfWeek}) = _$WorkingHoursImpl;

  factory _WorkingHours.fromJson(Map<String, dynamic> json) =
      _$WorkingHoursImpl.fromJson;

  @override
  String get id;
  @override
  @TimeOfDayConverter()
  TimeOfDay get startTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get endTime;
  @override
  String get dayOfWeek;
  @override
  @JsonKey(ignore: true)
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

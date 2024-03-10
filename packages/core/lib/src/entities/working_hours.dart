import 'package:core/src/converters/time_of_day_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_hours.freezed.dart';
part 'working_hours.g.dart';

@freezed
class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    required String id,
    @TimeOfDayConverter() required TimeOfDay startTime,
    @TimeOfDayConverter() required TimeOfDay endTime,
    required String dayOfWeek,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, Object?> json) =>
      _$WorkingHoursFromJson(json);
}

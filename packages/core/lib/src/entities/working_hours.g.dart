// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkingHoursImpl _$$WorkingHoursImplFromJson(Map<String, dynamic> json) =>
    _$WorkingHoursImpl(
      id: json['id'] as String,
      startTime:
          const TimeOfDayConverter().fromJson(json['startTime'] as String),
      endTime: const TimeOfDayConverter().fromJson(json['endTime'] as String),
      dayOfWeek: json['dayOfWeek'] as String,
    );

Map<String, dynamic> _$$WorkingHoursImplToJson(_$WorkingHoursImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
      'dayOfWeek': instance.dayOfWeek,
    };

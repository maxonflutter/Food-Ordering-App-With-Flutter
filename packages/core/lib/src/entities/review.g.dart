// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'userId': instance.userId,
      'content': instance.content,
      'rating': instance.rating,
    };

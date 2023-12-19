// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      date: json['date'] as String?,
      weekday: json['weekday'] as String?,
      max: json['max'] as int?,
      min: json['min'] as int?,
      description: json['description'] as String?,
      condition: json['condition'] as String?,
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'date': instance.date,
      'weekday': instance.weekday,
      'max': instance.max,
      'min': instance.min,
      'description': instance.description,
      'condition': instance.condition,
    };

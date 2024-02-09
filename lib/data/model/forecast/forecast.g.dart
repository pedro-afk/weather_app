// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) => ForecastData(
      date: json['date'] as String,
      weekday: json['weekday'] as String,
      max: json['max'] as int,
      min: json['min'] as int,
      rainProbability: json['rain_probability'] as String,
      windSpeedy: json['wind_speedy'] as String,
      description: json['description'] as String,
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$ForecastDataToJson(ForecastData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weekday': instance.weekday,
      'max': instance.max,
      'min': instance.min,
      'rain_probability': instance.rainProbability,
      'wind_speedy': instance.windSpeedy,
      'description': instance.description,
      'condition': instance.condition,
    };

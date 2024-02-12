// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      json['by'] as String,
      json['valid_key'] as bool,
      ResultData.fromJson(json['results'] as Map<String, dynamic>),
      (json['execution_time'] as num).toDouble(),
      json['from_cache'] as bool,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'by': instance.by,
      'valid_key': instance.validKey,
      'results': instance.results,
      'execution_time': instance.executionTime,
      'from_cache': instance.fromCache,
    };

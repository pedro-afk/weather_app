// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      by: json['by'] as String,
      validKey: json['valid_key'] as bool,
      results: Result.fromJson(json['results'] as Map<String, dynamic>),
      executionTime: (json['execution_time'] as num).toDouble(),
      fromCache: json['from_cache'] as bool,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'by': instance.by,
      'valid_key': instance.validKey,
      'results': instance.results,
      'execution_time': instance.executionTime,
      'from_cache': instance.fromCache,
    };

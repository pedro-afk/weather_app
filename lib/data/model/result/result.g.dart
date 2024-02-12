// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData(
      json['temp'] as int,
      json['date'] as String,
      json['time'] as String,
      json['condition_code'] as String,
      json['description'] as String,
      json['currently'] as String,
      json['cid'] as String,
      json['city'] as String,
      json['img_id'] as String,
      (json['humidity'] as num).toDouble(),
      (json['rain'] as num).toDouble(),
      (json['cloudiness'] as num).toDouble(),
      json['wind_speedy'] as String,
      json['sunrise'] as String,
      json['sunset'] as String,
      json['condition_slug'] as String,
      json['city_name'] as String,
      json['timezone'] as String,
      (json['forecast'] as List<dynamic>)
          .map((e) => ForecastData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'date': instance.date,
      'time': instance.time,
      'condition_code': instance.conditionCode,
      'description': instance.description,
      'currently': instance.currently,
      'cid': instance.cid,
      'city': instance.city,
      'img_id': instance.imgId,
      'humidity': instance.humidity,
      'rain': instance.rain,
      'cloudiness': instance.cloudiness,
      'wind_speedy': instance.windSpeedy,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'condition_slug': instance.conditionSlug,
      'city_name': instance.cityName,
      'timezone': instance.timezone,
      'forecast': instance.forecast,
    };

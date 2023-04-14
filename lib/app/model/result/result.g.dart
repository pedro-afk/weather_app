// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      temp: json['temp'] as int?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      conditionCode: json['condition_code'] as String?,
      description: json['description'] as String?,
      currently: json['currently'] as String?,
      cid: json['cid'] as String?,
      city: json['city'] as String?,
      imgId: json['img_id'] as String?,
      humidity: json['humidity'] as int?,
      windSpeedy: json['wind_speedy'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      conditionSlug: json['condition_slug'] as String?,
      cityName: json['city_name'] as String?,
      forecast: (json['forecast'] as List<dynamic>?)
          ?.map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
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
      'wind_speedy': instance.windSpeedy,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'condition_slug': instance.conditionSlug,
      'city_name': instance.cityName,
      'forecast': instance.forecast,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

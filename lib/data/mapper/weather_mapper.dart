import 'package:weatherapp/data/model/forecast/forecast.dart';
import 'package:weatherapp/data/model/result/result.dart';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/domain/weather.dart';

extension WeatherDataMapper on WeatherData {
  Weather toDomain() {
    return Weather(
      by,
      validKey,
      results.toDomain(),
      executionTime,
      fromCache,
    );
  }
}

extension ResultDataMapper on ResultData {
  Result toDomain() {
    return Result(
      temp,
      date,
      time,
      conditionCode,
      description,
      currently,
      cid,
      city,
      imgId,
      humidity,
      rain,
      cloudiness,
      windSpeedy,
      sunrise,
      sunset,
      conditionSlug,
      cityName,
      timezone,
      forecast.map((e) => e.toDomain()).toList(),
    );
  }
}

extension ForecastDataMapper on ForecastData {
  Forecast toDomain() {
    return Forecast(
      date,
      weekday,
      max,
      min,
      rainProbability,
      windSpeedy,
      description,
      condition,
      rain,
      cloudiness,
    );
  }
}

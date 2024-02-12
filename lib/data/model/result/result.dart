import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/data/model/forecast/forecast.dart';
part 'result.g.dart';

@JsonSerializable()
class ResultData {
  int temp;
  String date;
  String time;
  @JsonKey(name: 'condition_code')
  String conditionCode;
  String description;
  String currently;
  String cid;
  String city;
  @JsonKey(name: 'img_id')
  String imgId;
  double humidity;
  double rain;
  double cloudiness;
  @JsonKey(name: 'wind_speedy')
  String windSpeedy;
  String sunrise;
  String sunset;
  @JsonKey(name: 'condition_slug')
  String conditionSlug;
  @JsonKey(name: 'city_name')
  String cityName;
  String timezone;
  List<ForecastData> forecast = [];

  ResultData(
      this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.rain,
      this.cloudiness,
      this.windSpeedy,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName,
      this.timezone,
      this.forecast);

  factory ResultData.fromJson(Map<String, dynamic> data) => _$ResultDataFromJson(data);

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

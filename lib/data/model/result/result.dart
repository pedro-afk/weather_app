import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/data/model/forecast/forecast.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'temp')
  int? temp;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'condition_code')
  String? conditionCode;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'currently')
  String? currently;
  @JsonKey(name: 'cid')
  String? cid;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'img_id')
  String? imgId;
  @JsonKey(name: 'humidity')
  int? humidity;
  @JsonKey(name: 'wind_speedy')
  String? windSpeedy;
  @JsonKey(name: 'sunrise')
  String? sunrise;
  @JsonKey(name: 'sunset')
  String? sunset;
  @JsonKey(name: 'condition_slug')
  String? conditionSlug;
  @JsonKey(name: 'city_name')
  String? cityName;
  @JsonKey(name: 'forecast')
  List<Forecast>? forecast;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  Result({
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
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.conditionSlug,
    this.cityName,
    this.forecast,
    this.latitude,
    this.longitude,
  });

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

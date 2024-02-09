import 'package:json_annotation/json_annotation.dart';
part 'forecast.g.dart';

@JsonSerializable()
class ForecastData {
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'weekday')
  String weekday;
  @JsonKey(name: 'max')
  int max;
  @JsonKey(name: 'min')
  int min;
  @JsonKey(name: 'rain_probability')
  String rainProbability;
  @JsonKey(name: 'wind_speedy')
  String windSpeedy;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'condition')
  String condition;

  ForecastData({
    required this.date,
    required this.weekday,
    required this.max,
    required this.min,
    required this.rainProbability,
    required this.windSpeedy,
    required this.description,
    required this.condition,
  });

  factory ForecastData.fromJson(Map<String, dynamic> data) =>
      _$ForecastDataFromJson(data);

  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}

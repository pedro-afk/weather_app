import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/data/model/result/result.dart';
part 'weather.g.dart';

@JsonSerializable()
class WeatherData {
  String by;
  @JsonKey(name: 'valid_key')
  bool validKey;
  ResultData results;
  @JsonKey(name: 'execution_time')
  double executionTime;
  @JsonKey(name: 'from_cache')
  bool fromCache;

  WeatherData(
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  );

  factory WeatherData.fromJson(Map<String, dynamic> data) =>
      _$WeatherDataFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

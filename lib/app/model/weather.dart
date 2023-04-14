import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/app/model/result/result.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'by')
  String by;
  @JsonKey(name: 'valid_key')
  bool validKey;
  @JsonKey(name: 'results')
  Result results;
  @JsonKey(name: 'execution_time')
  double executionTime;
  @JsonKey(name: 'from_cache')
  bool fromCache;

  Weather({
    required this.by,
    required this.validKey,
    required this.results,
    required this.executionTime,
    required this.fromCache,
  });

  factory Weather.fromJson(Map<String, dynamic> data) =>
      _$WeatherFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

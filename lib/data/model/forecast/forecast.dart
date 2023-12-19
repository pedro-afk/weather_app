import 'package:json_annotation/json_annotation.dart';
part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'weekday')
  String? weekday;
  @JsonKey(name: 'max')
  int? max;
  @JsonKey(name: 'min')
  int? min;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'condition')
  String? condition;

  Forecast({
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> data) =>
      _$ForecastFromJson(data);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

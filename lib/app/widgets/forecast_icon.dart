import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/app/model/forecast/forecast.dart';

class ForecastIcons extends StatelessWidget {
  const ForecastIcons(
      {Key? key,
      required this.color,
      required this.size,
      required this.forecast})
      : super(key: key);
  final Color color;
  final double size;
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    if (forecast.condition == 'storm') {
      return Icon(WeatherIcons.storm_showers, color: color, size: size);
    } else if (forecast.condition == 'snow') {
      return Icon(WeatherIcons.snow, color: color, size: size);
    } else if (forecast.condition == 'hail') {
      return Icon(WeatherIcons.hail, color: color, size: size);
    } else if (forecast.condition == 'rain') {
      return Icon(WeatherIcons.rain, color: color, size: size);
    } else if (forecast.condition == 'fog') {
      return Icon(WeatherIcons.fog, color: color, size: size);
    } else if (forecast.condition == 'clear_day') {
      return Icon(WeatherIcons.day_sunny, color: color, size: size);
    } else if (forecast.condition == 'clear_night') {
      return Icon(WeatherIcons.night_clear, color: color, size: size);
    } else if (forecast.condition == 'cloud') {
      return Icon(WeatherIcons.cloud, color: color, size: size);
    } else if (forecast.condition == 'cloudly_day') {
      return Icon(WeatherIcons.day_cloudy, color: color, size: size);
    } else if (forecast.condition == 'cloudly_night') {
      return Icon(WeatherIcons.night_cloudy, color: color, size: size);
    } else {
      return Icon(Icons.report_problem_rounded, color: color, size: size);
    }
  }
}

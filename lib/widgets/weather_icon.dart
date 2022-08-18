import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../model/weather.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
      {Key? key,
        required this.color,
        required this.size,
        required this.weather})
      : super(key: key);
  final Color color;
  final double size;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    if (weather.results!.conditionSlug == 'storm') {
      return Icon(WeatherIcons.storm_showers, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'snow') {
      return Icon(WeatherIcons.snow, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'hail') {
      return Icon(WeatherIcons.hail, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'rain') {
      return Icon(WeatherIcons.rain, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'fog') {
      return Icon(WeatherIcons.fog, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'clear_day') {
      return Icon(WeatherIcons.day_sunny, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'clear_night') {
      return Icon(WeatherIcons.night_clear, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'cloud') {
      return Icon(WeatherIcons.cloud, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'cloudly_day') {
      return Icon(WeatherIcons.day_cloudy, color: color, size: size);
    } else if (weather.results!.conditionSlug == 'cloudly_night') {
      return Icon(WeatherIcons.night_cloudy, color: color, size: size);
    } else {
      return Icon(Icons.report_problem_rounded, color: color, size: size);
    }
  }
}
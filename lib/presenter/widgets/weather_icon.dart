import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapp/presenter/resources/assets_manager.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
      {Key? key,
        this.color,
        required this.size,
        required this.conditionSlug})
      : super(key: key);
  final Color? color;
  final double size;
  final String conditionSlug;

  @override
  Widget build(BuildContext context) {
    switch (conditionSlug) {
      case 'storm':
        return SvgPicture.asset(AssetsManager.storm, height: size);
      case 'snow':
        return SvgPicture.asset(AssetsManager.snow, height: size);
      case 'hail':
        return SvgPicture.asset(AssetsManager.hail, height: size);
      case 'rain':
        return SvgPicture.asset(AssetsManager.rain, height: size);
      case 'fog':
        return SvgPicture.asset(AssetsManager.fog, height: size);
      case 'clear_day':
        return SvgPicture.asset(AssetsManager.clearDay, height: size);
      case 'clear_night':
        return SvgPicture.asset(AssetsManager.clearNight, height: size);
      case 'cloud':
        return SvgPicture.asset(AssetsManager.cloud, height: size);
      case 'cloudly_day':
        return SvgPicture.asset(AssetsManager.cloudlyDay, height: size);
      case 'cloudly_night':
        return SvgPicture.asset(AssetsManager.cloudlyNight, height: size);
      default:
        return Icon(Icons.report_problem_rounded, color: color, size: size);
    }
  }
}
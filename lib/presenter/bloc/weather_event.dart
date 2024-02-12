import 'package:weatherapp/domain/weather.dart';

abstract class WeatherEvent {}

class WeatherInitializeEvent extends WeatherEvent {}

class WeatherEventLoading extends WeatherEvent {}

class WeatherEventRequestLocationPermission extends WeatherEvent {}

class WeatherEventError extends WeatherEvent {
  Weather? weather;
  String? errorMessage = "";
  WeatherEventError(this.errorMessage, {this.weather});
}

class WeatherEventSuccess extends WeatherEvent {
  Weather weather;
  WeatherEventSuccess({required this.weather});
}
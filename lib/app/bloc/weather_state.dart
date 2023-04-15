import 'package:weatherapp/app/model/weather.dart';

abstract class WeatherState {
  Weather? weather;
  WeatherState({this.weather});
}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSucess extends WeatherState {
  WeatherStateSucess({required Weather weather}) : super(weather: weather);
}

class WeatherStateError extends WeatherState {}

import 'package:weatherapp/domain/weather.dart';

abstract class WeatherState {
  Weather? weather;
  WeatherState({this.weather});
}

class WeatherStateLoading extends WeatherState {
  WeatherStateLoading() : super(weather: null);
}

class WeatherStateSuccess extends WeatherState {
  WeatherStateSuccess({required Weather weather}) : super(weather: weather);
}

class WeatherStateError extends WeatherState {
  WeatherStateError() : super(weather: null);
}

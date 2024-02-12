import 'package:weatherapp/domain/weather.dart';

abstract class WeatherState {
  Weather? weather;
  String? errorMessage;

  WeatherState({this.weather, this.errorMessage});
}

class WeatherStateLoading extends WeatherState {
  WeatherStateLoading() : super(weather: null);
}

class WeatherStateSuccess extends WeatherState {
  WeatherStateSuccess({required Weather weather}) : super(weather: weather);
}

class WeatherStateError extends WeatherState {
  WeatherStateError({String? errorMessage, Weather? weather})
      : super(
          weather: weather,
          errorMessage: errorMessage,
        );
}

class WeatherRequestPermissionState extends WeatherState {
  WeatherRequestPermissionState() : super(weather: null);
}

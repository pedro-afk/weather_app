import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/data/network/client_http.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/data/services/get_location.dart';
import 'package:weatherapp/domain/weather.dart';
import 'package:weatherapp/presenter/bloc/weather_event.dart';
import 'package:weatherapp/presenter/bloc/weather_state.dart';

class WeatherBloc {
  final _inputWeatherController = StreamController<WeatherEvent>();
  final _outputWeatherController = StreamController<WeatherState>.broadcast();

  Stream<WeatherEvent> get inputWeatherStream => _inputWeatherController.stream;
  Sink<WeatherEvent> get inputWeatherEvent => _inputWeatherController.sink;
  Stream<WeatherState> get outputWeatherStream => _outputWeatherController.stream;
  Sink<WeatherState> get outputWeatherState => _outputWeatherController.sink;

  final WeatherRepository _repository;
  final GeolocationService geolocationService;

  WeatherBloc(this._repository, this.geolocationService);

  void initialize() {
    inputWeatherEvent.add(WeatherInitializeEvent());
    inputWeatherStream.listen(mapEventToState);
  }

  void mapEventToState(WeatherEvent event) async {
    if (event is WeatherInitializeEvent) {
      await loadWeather();
    } else if (event is WeatherEventRequestLocationPermission) {
      outputWeatherState.add(WeatherRequestPermissionState());
    } else if (event is WeatherEventError) {
      outputWeatherState.add(
        WeatherStateError(
          weather: event.weather,
          errorMessage: event.errorMessage,
        ),
      );
    } else if (event is WeatherEventSuccess) {
      outputWeatherState.add(
        WeatherStateSuccess(weather: event.weather),
      );
    } else if (event is WeatherEventLoading) {
      outputWeatherState.add(WeatherStateLoading());
    }
  }

  Future<void> loadWeather() async {
    inputWeatherEvent.add(WeatherEventLoading());
    try {
      LocationPermission permissionStatus =
          await geolocationService.getStatusPermission();

      if (permissionStatus == LocationPermission.denied ||
          permissionStatus == LocationPermission.deniedForever) {
        inputWeatherEvent.add(WeatherEventRequestLocationPermission());
        return;
      }
      Position position = await geolocationService.getCurrentPosition();
      Weather? weather = await _repository.fetchDataWeather(
          position.latitude.toString(), position.longitude.toString());
      if (weather != null) {
        inputWeatherEvent.add(WeatherEventSuccess(weather: weather));
      }
    } on ClientHttpException catch (e) {
      inputWeatherEvent.add(WeatherEventError(e.message));
    } catch (e) {
      inputWeatherEvent.add(
        WeatherEventError(
          "Ops... An error happened on system",
        ),
      );
    }
  }

  void dispose() {
    _outputWeatherController.close();
    _inputWeatherController.close();
  }
}

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/domain/weather.dart';
import 'package:weatherapp/presenter/bloc/weather_event.dart';
import 'package:weatherapp/presenter/bloc/weather_state.dart';

class WeatherBloc {
  final WeatherRepository _repository;

  final _inputWeatherController = StreamController<WeatherEvent>();
  final _outputWeatherController = StreamController<WeatherState>();

  Sink<WeatherEvent> get inputWeather => _inputWeatherController.sink;
  Stream<WeatherState> get stream => _outputWeatherController.stream;

  String dateFormatted = "";
  bool isNight = false;

  void setIsNight(bool value) => isNight = value;

  WeatherBloc(this._repository);

  void initListener() {
    _inputWeatherController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(WeatherEvent event) async {
    if (event is LoadWeatherEvent) {
      loadWeather();
    }
  }

  Future<void> loadWeather() async {
    _outputWeatherController.add(WeatherStateLoading());
    try {
     /* Position position = await requestPermissionLocation();
      Weather? weather = null;*//* await _repository.fetchDataWeather(
        lat: position.latitude.toString(),
        lng: position.longitude.toString(),
      );*//*
      validNightMode(weather!);
      formatDate();

      _outputWeatherController.add(WeatherStateSucess(weather: weather));*/
    } catch (e) {
      _outputWeatherController.add(WeatherStateError());
      throw Exception(e);
    }
  }

  void formatDate() {
    String dateString = DateFormat('MMMMEEEEd', "pt_BR").format(DateTime.now());
    dateFormatted = dateString;
  }

  void validNightMode(Weather weather) {
    if (weather.results.currently.contains("noite")) {
      setIsNight(true);
    } else {
      setIsNight(false);
    }
  }

  void dispose() {
    _inputWeatherController.close();
  }
}

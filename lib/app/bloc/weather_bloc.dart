import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/app/model/weather.dart';
import 'package:weatherapp/app/repository/weather_repository.dart';
import 'package:weatherapp/app/services/get_location.dart';

class WeatherBloc {
  final WeatherRepository _homeRepository;
  WeatherBloc(this._homeRepository);

  final _streamController = StreamController<Weather>.broadcast();

  get weatherStream => _streamController.stream;

  bool starting = true;
  late bool loading;
  late String dateFormatted;
  late bool isNight;

  void setStarting(bool value) => starting = value;
  void setLoading(bool value) => loading = value;
  void setIsNight(bool value) => isNight = value;

  Future<void> loadWeather() async {
    try {
      setLoading(true);
      Position position = await requestPermissionLocation();
      Weather weather = await _homeRepository.fetchDataWeather(
        lat: position.latitude.toString(),
        lng: position.longitude.toString(),
      );
      validNightMode(weather);
      formatDate();
      setLoading(false);
      setStarting(false);
      _streamController.sink.add(weather);
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  void formatDate() {
    String dateString = DateFormat('MMMMEEEEd', "pt_BR").format(DateTime.now());
    dateFormatted = dateString;
  }

  void validNightMode(Weather weather) {
    if (weather.results!.currently!.contains("noite")) {
      setIsNight(true);
    } else {
      setIsNight(false);
    }
  }

  void close() {
    _streamController.close();
  }
}

import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/services/get_location.dart';

import '../repositorie/home_repository.dart';

class WeatherBloc {
  Weather weather = Weather();
  final HomeRepository _homeRepository = HomeRepository();
  final _streamController = StreamController<Weather>.broadcast();

  get weatherStream => _streamController.stream;

  bool starting = true;
  late bool loading;
  late String dateFormatted;
  late bool isNight;

  void setStarting(bool value) => starting = value;
  void setLoading(bool value) => loading = value;
  void setIsNight(bool value) => isNight = value;

  loadWeather() async {
    try {
      setLoading(true);
      Position position = await requestPermissionLocation();
      weather = await _homeRepository.fetchDataWeather(
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

  formatDate() {
    String dateString = DateFormat('MMMMEEEEd', "pt_BR").format(DateTime.now());
    dateFormatted = dateString;
  }

  validNightMode(Weather weather) {
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

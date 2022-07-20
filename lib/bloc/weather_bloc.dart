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

  late final String dateFormatted;
  late final bool isNight;

  loadWeather() async {
    Position position = await requestPermissionLocation();
    weather = await _homeRepository.fetchDataWeather(
      lat: position.latitude.toString(),
      lng: position.longitude.toString(),
    );
    validNightMode(weather);
    formatDate();
    _streamController.sink.add(weather);
  }

  formatDate() {
    String dateString = DateFormat('MMMMEEEEd', "pt_BR").format(DateTime.now());
    dateFormatted = dateString;
  }

  validNightMode(Weather weather) {
    if (weather.results!.currently!.contains("noite")) {
      isNight = true;
    } else {
      isNight = false;
    }
  }

  void close() {
    _streamController.close();
  }
}

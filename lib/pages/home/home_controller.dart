import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repositories/home_repository.dart';
import 'package:weatherapp/services/get_location.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  HomeRepository repository = HomeRepository();

  @observable
  Weather weather = Weather();
  @observable
  bool isLoading = false;
  @observable
  String message = "";

  @action
  setIsLoading(bool value) {
    isLoading = value;
  }

  @action
  setMessage(String value) {
    message = value;
  }

  fetchData() async {
    try {
      setIsLoading(true);
      Position position = await requestPermissionLocation();

      weather = await repository.fetchDataWeather(
          lat: '${position.latitude}', lng: '${position.longitude}');

      if (weather.results!.toJson().isEmpty) {
        setIsLoading(false);
        setMessage("Nenhuma resposta encontrada");
        return;
      }

      setIsLoading(false);
    } catch (e) {
      setMessage("Ops... Ocorreu um erro!");
      setIsLoading(false);
      throw Exception('$e');
    }
  }
}

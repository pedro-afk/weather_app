import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repositories/home_repository.dart';
import 'package:weatherapp/services/get_location.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository? repository;

  _HomeControllerBase({this.repository});

  @observable
  Weather weather = Weather();
  @observable
  bool isLoading = false;
  @observable
  String message = "";
  @observable
  bool isNight = false;
  @observable
  String dateInFull = "";
  @observable
  String weatherCode = "";
  @observable
  bool isError = false;

  @action
  setIsLoading(bool value) {
    isLoading = value;
  }

  @action
  setMessage(String value) {
    message = value;
  }

  @action
  setNightMode(bool value) {
    isNight = value;
  }

  @action
  setDate(String value) {
    dateInFull = value;
  }

  @action
  setIsError(bool value) {
    isError = value;
  }

  fetchData() async {
    try {
      formatDate();
      setIsLoading(true);
      Position position = await requestPermissionLocation();

      weather = await repository!.fetchDataWeather(
          lat: '${position.latitude}', lng: '${position.longitude}');

      if (weather.results!.toJson().isEmpty) {
        setIsLoading(false);
        setIsError(true);
        setMessage("Ops... Não foi possível carregar os dados!");
        return;
      }

      validNightMode(weather);

      setIsError(false);
      setIsLoading(false);
    } catch (e) {
      setMessage("Ops... Ocorreu um erro!");
      setIsError(true);
      setIsLoading(false);
      throw Exception('$e');
    }
  }

  formatDate() {
    String dateString = DateFormat('MMMMEEEEd', "pt_BR").format(DateTime.now());
    setDate(dateString);
  }

  validNightMode(Weather weather) {
    if (weather.results!.currently!.contains("noite")) {
      setNightMode(true);
    } else {
      setNightMode(false);
    }
  }
}

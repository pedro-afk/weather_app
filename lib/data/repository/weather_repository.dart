import 'package:weatherapp/data/mapper/weather_mapper.dart';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/provider/weather_api_provider.dart';
import 'package:weatherapp/domain/weather.dart';

class WeatherRepository {
  final WeatherApiProvider _provider;
  WeatherRepository(this._provider);

  Future<Weather?> fetchDataWeather(String lat, String lng) async {
    WeatherData? weather = await _provider.fetchDataWeather(lat, lng);
    return weather?.toDomain();
  }
}

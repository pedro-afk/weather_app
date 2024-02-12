import 'dart:convert';
import 'package:weatherapp/data/model/weather.dart';
import 'package:weatherapp/data/network/api_endpoints.dart';
import 'package:weatherapp/data/network/client_http.dart';

class WeatherApiProvider {
  final ClientHttp _client;

  WeatherApiProvider(this._client);

  Future<WeatherData?> fetchDataWeather(String lat, String lng) async {
    try {
      final response =
          await _client.get(ApiEndpoints.weatherByLocation(lat, lng));

      if (response.statusCode != 200) {
        throw ClientHttpException(
          requestOptions: response.requestOptions,
          response: response,
          message: response.statusMessage,
        );
      }
      final encodeResponse = jsonEncode(response.data);
      return WeatherData.fromJson(jsonDecode(encodeResponse));
    } on ClientHttpException catch (e, stackTrace) {
      throw ClientHttpException(
        requestOptions: e.requestOptions,
        message: e.message,
        response: e.response,
        stackTrace: stackTrace,
      );
    } catch (e) {
      rethrow;
    }
  }
}

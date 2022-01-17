import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather.dart';

class HomeRepository {
  Future<Weather> fetchDataWeather({String? lat, String? lng}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.hgbrasil.com/weather?key=${dotenv.env['API_KEY']}&lat=$lat&lon=${lng}user_ip=remote'),
      );

      if (response.statusCode != 200) {
        throw Exception("Erro: status code ${response.statusCode}");
      }

      return Weather.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception('$e');
    }
  }
}

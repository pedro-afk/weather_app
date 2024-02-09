import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiEndpoints {
  static String baseUrl = 'https://api.hgbrasil.com/weather?key=${dotenv.env['API_KEY']}';
  static String weatherByLocation(String lat, String lng) => '/&lat=$lat&lon=${lng}user_ip=remote';
}
import 'package:get_it/get_it.dart';
import 'package:weatherapp/app/bloc/weather_bloc.dart';
import 'package:weatherapp/app/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void injections() {
  getIt.registerSingleton<WeatherRepository>(
    WeatherRepository(http.Client()),
  );

  getIt.registerSingleton<WeatherBloc>(
    WeatherBloc(
      getIt<WeatherRepository>(),
    ),
  );
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherapp/data/network/client_http.dart';
import 'package:weatherapp/data/provider/weather_api_provider.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/presenter/bloc/weather_bloc.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await dotenv.load(fileName: '.env');
  instance.registerLazySingleton<HttpClient>(() => ClientFactory.getInstance());
  instance.registerLazySingleton<WeatherApiProvider>(() => WeatherApiProvider(instance()));
  instance.registerLazySingleton<WeatherRepository>(() => instance());

  if (GetIt.I.isRegistered<WeatherBloc>()) {
    instance.registerFactory(() => WeatherBloc(instance()));
  }
}
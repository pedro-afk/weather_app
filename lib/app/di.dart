import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  await dotenv.load(fileName: '.env');
  /*getIt.registerSingleton<WeatherRepository>(
    WeatherRepository(http.Client()),
  );

  getIt.registerSingleton<WeatherBloc>(
    WeatherBloc(
      getIt<WeatherRepository>(),
    ),
  );*/
}

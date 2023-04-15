import 'package:flutter/material.dart';
import 'package:weatherapp/app/bloc/weather_bloc.dart';
import 'package:weatherapp/app/bloc/weather_event.dart';
import 'package:weatherapp/app/bloc/weather_state.dart';
import 'package:weatherapp/app/di/injections.dart';
import 'package:weatherapp/app/widgets/custom_text.dart';
import 'package:weatherapp/app/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<WeatherBloc>();
    _bloc.inputWeather.add(LoadWeatherEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WeatherState>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor:
              _bloc.isNight ? const Color(0xFF202020) : Colors.grey[300],
          body: snapshot.data is WeatherStateLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: _bloc.isNight ? Colors.white : Colors.black,
                  ),
                )
              : snapshot.data is WeatherStateError
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            "Não foi possível carregar as informações",
                            color: _bloc.isNight ? Colors.white : Colors.black,
                            fontSize: 18,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () =>
                                _bloc.inputWeather.add(LoadWeatherEvent()),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const CustomText(
                              "Tentar novamente",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  : WeatherWidget(
                      weather: snapshot.data!.weather!,
                      isNight: _bloc.isNight,
                      dateInFull: _bloc.dateFormatted,
                    ),
        );
      },
    );
  }
}

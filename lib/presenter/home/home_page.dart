import 'package:flutter/material.dart';
import 'package:weatherapp/app/di.dart';
import 'package:weatherapp/presenter/bloc/weather_bloc.dart';
import 'package:weatherapp/presenter/bloc/weather_event.dart';
import 'package:weatherapp/presenter/bloc/weather_state.dart';
import 'package:weatherapp/presenter/widgets/custom_text.dart';
import 'package:weatherapp/presenter/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherBloc _bloc = instance<WeatherBloc>();

  @override
  void initState() {
    _bloc.initListener();
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
    return Scaffold(
      body: StreamBuilder<WeatherState>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return snapshot.data is WeatherStateLoading
              ? const Center(child: CircularProgressIndicator())
              : snapshot.data is WeatherStateError
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            "Não foi possível carregar as informações",
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () =>
                                _bloc.inputWeather.add(LoadWeatherEvent()),
                            child: const CustomText(
                              "Tentar novamente",
                            ),
                          ),
                        ],
                      ),
                    )
                  : WeatherWidget(
                      weather: snapshot.data!.weather!,
                      isNight: _bloc.isNight,
                      dateInFull: _bloc.dateFormatted,
                    );
        },
      ),
    );
  }
}

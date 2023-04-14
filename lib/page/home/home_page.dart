import 'package:flutter/material.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/widgets/weather_widget.dart';

import '../../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = WeatherBloc();

  @override
  void initState() {
    _bloc.loadWeather();
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Weather>(
        stream: _bloc.weatherStream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: _bloc.starting
                ? Colors.grey[400]
                : _bloc.isNight
                    ? const Color(0xFF202020)
                    : Colors.grey[300],
            appBar: AppBar(
              title: CustomText(
                  text: _bloc.loading ? "..." : snapshot.data!.results!.city!),
              backgroundColor: _bloc.starting
                  ? Colors.grey[400]
                  : _bloc.isNight
                      ? const Color(0xFF404040)
                      : Colors.blue,
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _bloc.loadWeather();
                      });
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            body: _validateHasData(snapshot),
          );
        });
  }

  Widget _validateHasData(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return _bloc.loading
          ? Center(
              child: CircularProgressIndicator(
              color: _bloc.isNight ? Colors.white : Colors.black,
            ))
          : WeatherWidget(
              weather: snapshot.data!,
              isNight: _bloc.isNight,
              dateInFull: _bloc.dateFormatted);
    } else if (snapshot.hasError) {
      return Center(child: CustomText(text: "Erro ao tentar fazer requisição"));
    } else {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black),
      );
    }
  }
}

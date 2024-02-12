import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/app/di.dart';
import 'package:weatherapp/presenter/bloc/weather_bloc.dart';
import 'package:weatherapp/presenter/bloc/weather_event.dart';
import 'package:weatherapp/presenter/bloc/weather_state.dart';
import 'package:weatherapp/presenter/resources/app_strings.dart';
import 'package:weatherapp/presenter/widgets/snackbar.dart';
import 'package:weatherapp/presenter/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = instance<WeatherBloc>();

  @override
  void initState() {
    _bloc.initialize();
    _bloc.outputWeatherStream.listen(mapState);
    super.initState();
  }

  void mapState(WeatherState state) async {
    if (state is WeatherStateError) {
      showSnackBar(context, Text(state.errorMessage!));
    } else if (state is WeatherRequestPermissionState) {
      await showDialogRequestLocationPermission();
    }
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
        stream: _bloc.outputWeatherStream,
        builder: (context, snapshot) {
          if (snapshot.data is WeatherStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data is WeatherStateError) {
            return Wrap(
              runSpacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(snapshot.data!.errorMessage!),
                TextButton(
                  onPressed: () =>
                      _bloc.inputWeatherEvent.add(WeatherInitializeEvent()),
                  child: const Text(AppStrings.tryAgain),
                ),
              ],
            );
          }

          if (snapshot.data?.weather == null) {
            return Container();
          }

          return WeatherWidget(
            weather: snapshot.data!.weather!,
            dateInFull: "", // _bloc.dateFormatted,
          );
        },
      ),
    );
  }

  Future<void> showDialogRequestLocationPermission() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text(AppStrings.warning),
            content: const Text(AppStrings.dialogPermissionLocationMessage),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  final result = await _bloc.geolocationService.requestPermissionLocation();
                  if (result == LocationPermission.always || result == LocationPermission.whileInUse) {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                    _bloc.inputWeatherEvent.add(WeatherInitializeEvent());
                  }
                },
                child: const Text(AppStrings.proceed),
              ),
            ],
          ),
        );
      },
    );
  }
}

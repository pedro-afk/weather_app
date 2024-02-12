import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/domain/weather.dart';
import 'package:weatherapp/presenter/resources/app_strings.dart';
import 'package:weatherapp/presenter/widgets/weather_icon.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(
      {Key? key, required this.weather, required this.dateInFull})
      : super(key: key);
  final Weather weather;
  final String dateInFull;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weather.results.city,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                WeatherIcon(
                    size: 100, conditionSlug: weather.results.conditionSlug),
                const SizedBox(height: 24),
                Text(weather.results.description,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(DateFormat('MMMMEEEEd', 'pt-BR').format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 18),
                Text(
                  "${weather.results.temp}°",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(WeatherIcons.windy, size: 30),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(AppStrings.wind),
                              Text(weather.results.windSpeedy)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(WeatherIcons.humidity, size: 28),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(AppStrings.humidity),
                              Text("${weather.results.humidity}%"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: weather.results.forecast.length,
              scrollDirection: Axis.horizontal,
              key: key,
              itemBuilder: (context, idx) {
                Forecast forecast = weather.results.forecast[idx];
                return Card(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${forecast.date} - "),
                            Text(forecast.weekday),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.keyboard_arrow_up_rounded,
                                color: Colors.red),
                            Text("${forecast.max}°"),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                color: Theme.of(context).colorScheme.primary),
                            Text("${forecast.min}°"),
                          ],
                        ),
                        Text(forecast.description),
                        const SizedBox(height: 15),
                        WeatherIcon(
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                          conditionSlug: forecast.condition,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

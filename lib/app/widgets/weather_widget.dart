import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/app/model/forecast/forecast.dart';
import 'package:weatherapp/app/model/weather.dart';
import 'package:weatherapp/app/widgets/custom_text.dart';
import 'package:weatherapp/app/widgets/weather_icon.dart';

import 'forecast_icon.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(
      {Key? key,
      required this.weather,
      required this.isNight,
      required this.dateInFull})
      : super(key: key);
  final Weather weather;
  final bool isNight;
  final String dateInFull;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF404040),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              color: isNight ? Colors.blueGrey : Colors.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  WeatherIcon(color: Colors.white, size: 70, weather: weather),
                  const SizedBox(height: 25),
                  CustomText(
                    text: weather.results!.description!,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: dateInFull,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 25),
                  CustomText(
                    text: "${weather.results!.temp!}°",
                    color: Colors.white,
                    fontSize: 76,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                WeatherIcons.windy,
                                size: 30,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "Vento",
                                      color: Colors.white,
                                      fontSize: 16),
                                  CustomText(
                                    text: weather.results!.windSpeedy!,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          endIndent: 7,
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                WeatherIcons.humidity,
                                size: 28,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "Umidade",
                                      color: Colors.white,
                                      fontSize: 16),
                                  CustomText(
                                    text: "${weather.results!.humidity!}%",
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 14.0),
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: weather.results!.forecast!.length,
            scrollDirection: Axis.horizontal,
            key: key,
            itemBuilder: (context, idx) {
              Forecast forecast = weather.results!.forecast![idx];
              return SizedBox(
                width: 140,
                child: Card(
                  elevation: 5,
                  color: isNight ? const Color(0xFF303030) : Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "${forecast.date} - ",
                            color: isNight
                                ? Colors.white
                                : const Color(0xFF404040),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: "${forecast.weekday}",
                            color: isNight
                                ? Colors.white
                                : const Color(0xFF404040),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.keyboard_arrow_up_rounded,
                              color: Colors.red),
                          CustomText(
                            text: "${forecast.max}°",
                            color: isNight
                                ? Colors.white
                                : const Color(0xFF404040),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.blue),
                          CustomText(
                            text: "${forecast.min}°",
                            color: isNight
                                ? Colors.white
                                : const Color(0xFF404040),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      CustomText(
                        text: "${forecast.description}",
                        color: isNight ? Colors.white : const Color(0xFF404040),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 15),
                      ForecastIcons(
                        color: isNight ? Colors.white : const Color(0xFF404040),
                        size: 30,
                        forecast: forecast,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

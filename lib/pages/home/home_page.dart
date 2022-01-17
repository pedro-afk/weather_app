import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/pages/home/home_controller.dart';

import 'package:weatherapp/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    _controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildPage(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Color(0xFF404040),
            ))
      ],
    );
  }

  _body() {
    return Observer(builder: (_) {
      return Column(
        children: [
          CustomText(
            text: _controller.weather.results!.city!,
            color: const Color(0xFF404040),
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Icon(WeatherIcons.day_cloudy,
                        size: 70, color: Colors.white),
                    const SizedBox(height: 25),
                    CustomText(
                      text: _controller.weather.results!.description!,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: "Segunda, 17, Janeiro",
                      color: Colors.white,
                    ),
                    const SizedBox(height: 25),
                    CustomText(
                      text: "${_controller.weather.results!.temp!}°",
                      color: Colors.white,
                      fontSize: 76,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Container(
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
                                  WeatherIcons.wind,
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
                                      text: _controller
                                          .weather.results!.windSpeedy!,
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
                                      text:
                                          "${_controller.weather.results!.humidity!}%",
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    )
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
            width: 290,
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  CustomText(
                    text: "Previsão para os próximos dias",
                    color: const Color(0xFF404040),
                    fontSize: 17,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  _buildPage() {
    return Observer(builder: (_) {
      if (_controller.isLoading) {
        return _buildLoading();
      }
      return _body();
    });
  }

  _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

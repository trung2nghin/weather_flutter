import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/network/network_request.dart';

import 'package:intl/intl.dart';
import '../controllers/weather_controller.dart';
import '../models/weather_state.dart';
import 'forecast_page.dart';

final weatherProvider = StateNotifierProvider<WeatherController, WeatherState>((ref) => WeatherController());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  String? forecast1;
  int? timeNow = 0;

  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchWeathers();
    filterHour();
  }

  void fetchWeathers() async {
    await ForecastsNetworkRequest().fetchForecasts();
    ref.read(weatherProvider.notifier).addWeather();
  }

  void filterHour() {
    String formatter = DateFormat('Hm').format(now).split(':')[0];
    timeNow = int.parse(formatter);
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(weatherProvider);

    return Stack(children: <Widget>[
      Image.network(
        timeNow! >= 16 && timeNow! < 19
            ? 'https://i.pinimg.com/564x/59/6b/e1/596be1699b9eb23707e2b8c7b87a69a9.jpg'
            : timeNow! > 6 && timeNow! < 16
                ? 'https://i.pinimg.com/564x/61/ca/9d/61ca9decab6dca8ce4b862e96c9bfd76.jpg'
                : 'https://i.pinimg.com/564x/2d/04/9c/2d049cbb9a475f0bc2dedf220075c0d6.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: weatherData.isLoading == true
              ? const CircularProgressIndicator()
              : Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        weatherData.weather?.name ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'HelveticaNeue',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          '${((weatherData.weather?.main.temp.toDouble() ?? 273.15) - 273.15).toInt()}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Text(
                        weatherData.forecast?.current.condition.text ?? "aaaaaaaaa",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'HelveticaNeueBd',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          'H: ${(weatherData.forecast?.forecast.forecastday[0].day.maxtempC) ?? 0}°  L: ${(weatherData.forecast?.forecast.forecastday[0].day.mintempC) ?? 0}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'HelveticaNeueBd',
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: ListView(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                width: double.infinity,
                                height: 168,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.5),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: const EdgeInsets.only(left: 16),
                                            child: const Text('Partly cloudy conditions expected around 13:00',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Divider(
                                        color: Colors.white24,
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 96,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: weatherData.forecast?.forecast.forecastday[0].hour.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: ((context, index) => SizedBox(
                                              width: (MediaQuery.of(context).size.width - 48) / 5,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    '${weatherData.forecast?.forecast.forecastday[0].hour[index].time.split(' ')[1]}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily: 'HelveticaNeueBd',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.cloud,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    '${weatherData.forecast?.forecast.forecastday[0].hour[index].tempC}°',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'HelveticaNeueBd',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ForecastPage()),
                                  );
                                },
                                child: const Text(
                                  '10 DAY FORECAST',
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 600,
                                width: 50,
                                color: Colors.transparent,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectCard(
                                          title: 'SUN SET',
                                          main:
                                              '${DateTime.fromMillisecondsSinceEpoch(weatherData.weather?.sys.sunset ?? 0 * 1000).toString().split(' ')[1].split(':')[0]}:00',
                                          icon: Icons.brightness_6,
                                        ),
                                        SelectCard(
                                          title: 'FEELS LIKE',
                                          main:
                                              ('${((weatherData.weather?.main.feelsLike.toDouble() ?? 0) - 273.15).toInt()}°C'),
                                          icon: Icons.thermostat,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectCard(
                                          title: 'WIND',
                                          main: '${weatherData.weather?.wind.speed.toString() ?? ''} km/h',
                                          mainFs: 28,
                                          icon: Icons.wind_power_outlined,
                                        ),
                                        SelectCard(
                                          title: 'HUDMIDITY',
                                          main: '${weatherData.weather?.main.humidity ?? ''}%',
                                          icon: Icons.water_drop_outlined,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectCard(
                                          title: 'PRESSURE',
                                          main: '${weatherData.weather?.main.pressure ?? ''} hPa',
                                          mainFs: 28,
                                          icon: Icons.water_damage_outlined,
                                        ),
                                        SelectCard(
                                          title: 'VISIBILITY',
                                          main: '${(weatherData.weather?.visibility.toDouble() ?? 0) ~/ 1000} km',
                                          icon: Icons.visibility,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    ]);
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, this.title, this.main, this.icon, this.mainFs});

  final String? title;
  final String? main;
  final double? mainFs;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 172,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title ?? "",
                style: const TextStyle(
                  color: Color.fromARGB(255, 204, 204, 204),
                  fontSize: 15,
                  fontFamily: 'HelveticaNeueBd',
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              Text(
                main ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mainFs ?? 36,
                  fontFamily: 'HelveticaNeueBd',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}

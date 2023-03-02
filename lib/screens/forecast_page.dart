import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/forecasts.dart';
import '../network/network_request.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  Forecasts? forecast;
  int? timeNow = 0;
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchWeathers();
  }

  void fetchWeathers() async {
    final newWorkForecast = await ForecastsNetworkRequest.fetchForecasts();

    setState(() {
      forecast = newWorkForecast;
    });
  }

  void filterHour() {
    String formatter = DateFormat('Hm').format(now).split(':')[0];
    timeNow = int.parse(formatter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Go to today forecast',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(children: [
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
        Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: double.infinity,
              height: 380,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                          color: Color.fromARGB(255, 204, 204, 204),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '8-day forcast'.toUpperCase(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 204, 204, 204),
                            fontWeight: FontWeight.w400,
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.white24,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 560,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        itemCount: forecast?.forecast.forecastday.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) => SizedBox(
                              width: (MediaQuery.of(context).size.width - 48),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        '${forecast?.forecast.forecastday[index].date.split('-')[2] ?? ''} - ${forecast?.forecast.forecastday[index].date.split('-')[1] ?? ''}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.5,
                                          fontFamily: 'HelveticaNeueBd',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${forecast?.forecast.forecastday[index].day.mintempC ?? ''}°',
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 204, 204, 204),
                                        fontSize: 16,
                                        fontFamily: 'HelveticaNeueBd',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Stack(children: [
                                      Container(
                                        height: 4,
                                        width: 88,
                                        decoration: BoxDecoration(
                                          color: Colors.white24.withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 4,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 255, 81, 33),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Text(
                                      '${forecast?.forecast.forecastday[index].day.maxtempC ?? ''}°',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'HelveticaNeueBd',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

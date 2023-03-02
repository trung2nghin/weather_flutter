import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/forecasts.dart';
import '../models/weathers.dart';

const apiKey = '473ae1fa07d151d9a3c7678bf8ee0015';
const apiKey_01 = '0c4d7670f3ee4cde85162227230103';
const country = 'Vietnam';
const location = 'hanoi';

class NetworkRequest {
  static const String url = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey';
  static const String forecastUrl =
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey_01&q=$country&days=10&aqi=no&alerts=no';

  static Future<Weathers> fetchWeathers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Weathers.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cant get weathers');
    }
  }
}

class ForecastsNetworkRequest {
  static const String forecastUrl =
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey_01&q=$country&days=8&aqi=no&alerts=no';

  static Future<Forecasts> fetchForecasts() async {
    final response = await http.get(Uri.parse(forecastUrl));
    if (response.statusCode == 200) {
      return Forecasts.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cant get forecasts');
    }
  }
}

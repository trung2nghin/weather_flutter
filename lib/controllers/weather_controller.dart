import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather_state.dart';
import '../network/network_request.dart';

class WeatherController extends StateNotifier<WeatherState> {
  WeatherController() : super(WeatherState(null, null, true, null));

  void addWeather() async {
    state = state.copyWith(isLoading: true);
    final newWorkWeather = await NetworkRequest().fetchWeathers();
    final newWorkForecast = await ForecastsNetworkRequest().fetchForecasts();

    state = state.copyWith(weather: newWorkWeather, forecast: newWorkForecast, isLoading: false);
    state = state.copyWith(isLoading: false);
  }
}

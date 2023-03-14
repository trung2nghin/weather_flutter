import 'package:weather/models/index.dart';

import 'weathers.dart';

class WeatherState {
  final Weathers? weather;
  final Forecasts? forecast;
  final bool isLoading;
  final Exception? error;

  WeatherState(this.weather, this.forecast, this.isLoading, this.error);

  WeatherState copyWith({Weathers? weather, Forecasts? forecast, bool? isLoading, Exception? error}) {
    return WeatherState(
        weather ?? this.weather, forecast ?? this.forecast, isLoading ?? this.isLoading, error ?? this.error);
  }
}

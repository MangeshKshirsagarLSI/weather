part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherOnLoadState extends WeatherState {
  final Weather weather;

  const WeatherOnLoadState({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String error;

  const WeatherErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

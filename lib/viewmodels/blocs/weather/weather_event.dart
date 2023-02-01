part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherOnLoadEvent extends WeatherEvent {
  final String location;
  const WeatherOnLoadEvent({required this.location });
  @override
  List<Object?> get props => [location];
}

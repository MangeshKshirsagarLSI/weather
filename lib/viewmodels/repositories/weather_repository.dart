import 'dart:async';

import 'package:weather/models/weather.dart';

abstract class WeatherRepository{
  FutureOr<Weather> getWeatherData ({required String location});
}
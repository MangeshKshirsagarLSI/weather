import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather/viewmodels/repositories/weather_repository.dart';
import '../../core/app_constants.dart';
import '../../models/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository{
  final Dio _dio = Dio();

  @override
  FutureOr<Weather> getWeatherData({required String location}) async {
    try{
      final result = await _dio.get(
          AppConstants.base_url + AppConstants.weather_endpoint,
          queryParameters: {'key': AppConstants.apiKey, 'q': location});
      return weatherFromJson(jsonEncode(result.data));
    }
    catch(e){
      return weatherFromJson(jsonEncode({'error': e.toString()}));
    }
  }
}
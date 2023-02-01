import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/models/CitiesResponseModel.dart';
import 'package:weather/models/cities.dart';

import '../../core/app_constants.dart';
import '../../viewmodels/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final Dio _dio = Dio();

  @override
  FutureOr<CitiesResponseModel> getCities({required String queryText}) async{
    try {
      final result = await _dio.get(
          AppConstants.base_url + AppConstants.search_endpoint,
          queryParameters: {'key': AppConstants.apiKey, 'q': queryText});
      return CitiesResponseModel(cities:citiesFromJson(jsonEncode(result.data)));
    }
    catch(e){
      return CitiesResponseModel(cities:[],error: e.toString());
    }
  }
}
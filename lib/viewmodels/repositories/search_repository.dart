import 'dart:async';
import '../../models/CitiesResponseModel.dart';

abstract class SearchRepository {
  FutureOr<CitiesResponseModel> getCities({required String queryText});
}
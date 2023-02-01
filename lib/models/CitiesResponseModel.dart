
import 'package:equatable/equatable.dart';

import 'cities.dart';

class CitiesResponseModel extends Equatable {
  final String? error;
  final List<Cities>? cities;

  const CitiesResponseModel({this.error,this.cities});
  @override
  List<Object?> get props => [error,cities];
}
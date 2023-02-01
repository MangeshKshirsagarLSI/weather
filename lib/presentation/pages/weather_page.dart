import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/viewmodels/blocs/weather/weather_bloc.dart';

import '../views/weather_view.dart';

class WeatherPage extends StatelessWidget {
  final String location;

  const WeatherPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) =>
          WeatherBloc()..add(WeatherOnLoadEvent(location: location)),
      child: const WeatherView(),
    );
  }
}

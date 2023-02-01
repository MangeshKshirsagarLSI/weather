import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/views/ErrorView.dart';

import '../../viewmodels/blocs/weather/weather_bloc.dart';
import '../widget/weather_widget.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if(state is WeatherOnLoadState){
          return WeatherWidget(weather: state.weather);
        }
        else if (state is WeatherErrorState){
          return ErrorView(error: state.error);
        }
        else{
          return const ErrorView(error: 'Loading...');
        }
      },
    );
  }
}

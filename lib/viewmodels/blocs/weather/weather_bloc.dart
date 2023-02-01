import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repositoryImplementations/weather_repo_impl.dart';
import 'package:weather/viewmodels/repositories/weather_repository.dart';
import '../../../models/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {


  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherOnLoadEvent>((event, emit) async {
      final WeatherRepository weatherRepository = WeatherRepositoryImpl();
      final weather = await weatherRepository.getWeatherData(location: event.location);
      if(weather.error==null)
      {
        emit(WeatherOnLoadState(weather: weather));
      }
      else{
        emit(WeatherErrorState(error: weather.error??''));
      }
    });
  }
}

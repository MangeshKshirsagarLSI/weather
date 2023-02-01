import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repositoryImplementations/search_repository_impl.dart';
import 'package:weather/models/cities.dart';
import 'package:weather/viewmodels/repositories/search_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {

    on<SearchPageOnLoadEvent>((event, emit) {
      emit(const SearchOnLoadState(cities: []));
    });

    on<SearchCitiesEvent>((event, emit) async {
      final SearchRepository searchRepository = SearchRepositoryImpl();
      final citiesResponseModel = await searchRepository.getCities(queryText: event.queryText);
      if(citiesResponseModel.error==null){
        emit(SearchOnLoadState(cities: citiesResponseModel.cities??[]));
      }
      else{
        emit(SearchPageError(error: citiesResponseModel.error??''));
      }
    });
  }
}

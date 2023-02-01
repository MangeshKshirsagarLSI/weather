part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchOnLoadState extends SearchState{
  final List<Cities> cities;
 const SearchOnLoadState({required this.cities});
  @override
  List<Object?> get props => [cities];
}


class SearchPageError extends SearchState{
  final String error;
  const SearchPageError({required this.error});
  @override
  List<Object?> get props => [error];
}

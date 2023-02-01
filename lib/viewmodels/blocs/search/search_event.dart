part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class SearchPageOnLoadEvent extends SearchEvent{

}

class SearchCitiesEvent extends SearchEvent{
  final String queryText;
  const SearchCitiesEvent({required this.queryText});
  @override
  List<Object?> get props => [queryText];
}
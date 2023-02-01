import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/pages/search_page.dart';
import 'package:weather/presentation/views/ErrorView.dart';
import 'package:weather/viewmodels/blocs/search/search_bloc.dart';
import 'package:weather/viewmodels/blocs/weather/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SearchBloc>(
          create: (context) => SearchBloc()..add(SearchPageOnLoadEvent())),
    ], child: App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchOnLoadState) {
            return SearchPage(cities: state.cities,);
          } else if (state is SearchPageError) {
            return ErrorView(error: state.error);
          } else {
            return const ErrorView(error: 'Loading...');
          }
        },
      ),
    );
  }
}

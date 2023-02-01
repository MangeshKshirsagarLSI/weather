import 'package:flutter/material.dart';

import '../../models/cities.dart';
import '../widget/search_widget.dart';

class SearchView extends StatelessWidget {
  final List<Cities> cities;
  const SearchView({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page'),),
      body:  SearchWidget(cities: cities,),
    );
  }
}

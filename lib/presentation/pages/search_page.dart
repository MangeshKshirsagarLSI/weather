import 'package:flutter/material.dart';

import '../../models/cities.dart';
import '../views/search_view.dart';

class SearchPage extends StatelessWidget {
  final List<Cities> cities;
   const SearchPage({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchView(cities: cities,);
  }
}
